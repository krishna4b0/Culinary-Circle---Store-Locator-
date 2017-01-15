<%--

  Daily Deals Coupons Component - Outputs a collection of offers of the selected type
  Author: John Dawson

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.OffersByType"%><%
    OffersByType offersByType = new OffersByType(pageContext);
    pageContext.setAttribute("offersByType", offersByType);
    Object offerType = properties.get("offerType");
%>

<!-- For debugging only
<h5>OfferType = "<%= offerType %>"</h5>
-->

<div class="offer-list">
  <c:choose>
    <c:when test = "${empty offersByType.offers}">
      <p class="no-offers">Sorry, there are no offers available at this time.</p>
    </c:when>
    <c:otherwise>
      <c:forEach var="offer" items="${offersByType.offers}">
        <div class="item-container">
          <div class="sale-item">
            <div class="item-image">
              <img src="${offer.logoUrl}">
            </div>
          </div>
          <div class="item-info">
            <div class="item-details">
              <p class="price">${offer.savingsValueStatement }</p>
              <p class="name">${offer.purchaseDescription}</p>
            </div>
          </div>
          <c:if test="${offer.printable}">
            <div class="coupon-options">
              <div class="add-to-list-container">
                <a class="print-now" id="${offer.couponId}" href="#" onclick="//_gaq.push(['_trackEvent', 'Coupons', 'PrintItem', ${offer.couponId}]);">
                  <span>Print now</span>
                </a>
              </div>

              <div class="add-to-list-container">
              	<c:if test="${not suppressShoppingList}">
	                <c:choose>
	                  <c:when test="${offer.onList}">
	                    <a class="add-to-print listed" href="#">
	                      <span class="unlisted">Print with my shopping list</span>
	                      <span class="listed">Will print with your list!</span>
	                    </a>
	                  </c:when>
	                  <c:otherwise>
	                    <fmt:formatDate pattern="MM/dd/yyyy" value="${offer.endOn}" var="formattedEndDate" />
	                    <c:url value="/services/shoppinglist.activelist.html" var="addItemUrl">
	                      <c:param name="action" value="addItem"/>
	                      <c:param name="itemTxt" value="${offer.displayName}"/>
	                      <c:param name="itemQtyTxt" value="1" />
	                      <c:param name="itemId" value="${offer.couponId}"/>
	                      <c:param name="expirationDate" value="${formattedEndDate}"/>
	                      <c:param name="itemType" value="COUPON"/>
	                      <c:param name="itemSource" value="Coupon"/>
	                      <c:param name="itemValue" value="${offer.value}"/>
	                      <c:param name="itemAdditionalInfo" value="${offer.savingsValueStatement} -- ${offer.purchaseDescription}"/>
	                      <c:param name="resource" value="${currentPage.path}.html" />
	                    </c:url>
	                    <a id="print" onclick="//_gaq.push(['_trackEvent', '${currentPage.title}', 'AddCouponToCard', '${offer.displayName}']);" class="add-to-print" href="${addItemUrl}">
	                      <span class="unlisted">Print with my shopping list</span>
	                      <span class="listed">Will print with your list!</span>
	                    </a>
	                  </c:otherwise>
	                </c:choose>
	               </c:if>
              </div>
            </div>
          </c:if>
          <div class="sale-date">Expires <fmt:formatDate pattern="MM-dd-yyyy" value="${offer.endOn}"/></div>
        </div>
      </c:forEach>
	  <div id="printCouponId" style="display: none">&nbsp;</div>
    </c:otherwise>
  </c:choose>
</div>
<iframe width="0" title="coupons" style="width: 0px !important; height: 0px !important; border: none !important;" src="" name="ci_ic1" id="ci_ic1" height="0">
	IFrame's not supported by your browser!
</iframe>
${offersByType.detectionScript}

${offersByType.printScript}

<script type="text/javascript">
  $(document).ready(function() {

    // Unbind first to prevent multiple handlers
    $("a.print-now").unbind("click").click(function(evt) {
      evt.preventDefault();
      var couponId = $(this).attr("id");
      $("#printCouponId").html(couponId);
      ci_CheckInstall();
    });

    // Unbind first to prevent multiple handlers
    $("a.add-to-print").unbind("click").click(function(evt) {
        evt.preventDefault();
        $this = $(this);

        if(!$this.hasClass("listed")) {
          var itemHref = $this.attr("href");
          var itemTxt = itemHref.match(/itemTxt=([^&?=]+)/)[1];
          var itemId = itemHref.match(/itemId=([^&?=]+)/)[1];
          var itemExpDate = itemHref.match(/expirationDate=([^&?=]+)/)[1];
          var itemAddInfo = itemHref.match(/itemAdditionalInfo=([^&?=]+)/)?itemHref.match(/itemAdditionalInfo=([^&?=]+)/)[1]:'';

          if(typeof _gaq !== "undefined"){
            //_gaq.push(["_trackEvent", "${currentPage.title}", "AddCouponToList", itemTxt]);
          }

          $.ajax({type: "POST",
                  cache: false,
                  url: "/services/shoppinglist.activelist.json",
                  data: {"itemTxt": itemTxt,
                         "itemQtyTxt": 1,
                         "itemType": "COUPON",
                         "itemId": decodeURIComponent(itemId).replace(/[+]/g," "),
                         "expirationDate": decodeURIComponent(itemExpDate).replace(/[+]/g," "),
                         "itemSource": "Coupon",
                         "itemAdditionalInfo": itemAddInfo,
                         "action": "addItems"
                  },
                  success: function(data){
                    $this.addClass("listed");
                    $this.attr("href","#");

                    refreshShoppingListWidget(data,false);

                    var addedItem = $("#shopping-list-sidebar-items > tbody > tr").first();
                    glowElement(addedItem);
                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                    alert("An error has occurred while trying to add this item to your shopping list, Please try again.");
                  },
                  dataType: "json"
          });
        }
    });
  });
  var bDetectionSuccess = false;
function handlePrinterDetection(code) {
    if(code != 0) {
        bDetectionSuccess = true;
        var sCouponIDs = svu_getCouponId();
        $.ajax({
            type: 'POST',
            cache: false,
            url: '/services/coupons/print.json',
            data: {
                couponIds: sCouponIDs,
                deviceId: code,
                storeId: '${offersByType.storeId}'
            }, 
            success: function(data){
                var sMessage='Click OK to print your coupons.';
                if(data.failedCoupons) {
                    sMessage = 'Some of your coupons were unavailable for printing. You may have already printed them the maximum number of times.\n\nClick OK to print the rest.';
                } 
                
                alert(sMessage);
                var eFrame = document.getElementById("ci_ic1");
                eFrame.src = data.source;
                
            },
            error: function(jqXHR, textStatus, errorThrown){
                var  sMessage = 'Your coupon(s) were unavailable for printing. You may have already printed this coupon the maximum number of times.';
                alert(sMessage);
            }
        });
        return;
    } else {
        if(bDetectionSuccess){
            return;
        }
        ci_downloadFFSilent();
    }
}

function svu_getCouponId() {
    var nlCoupons = $('#printCouponId').html().split(",");
    return nlCoupons;
}

</script>

