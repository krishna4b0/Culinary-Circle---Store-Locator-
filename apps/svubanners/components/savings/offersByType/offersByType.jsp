<%--

  Offers By Type Component - Outputs a collection of offers of the selected type
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
      <div class="offers-outer">
        <c:forEach var="offer" items="${offersByType.offers}">
          <div class="coupon-outer">
            <div class="coupon-inner">
              <img src="${offer.logoUrl}" class="img-left framed">
                <div class="clearfix itemlinks">
                  <h3>${offer.displayName}</h3>
                  <p>
                    <strong>${offer.savingsValueStatement}</strong>
                  </p>
                </div>
              </div>
              <div class="coupon-options">
                <c:if test="${offer.cardable}">
                  <div class="add-to-list-container">
                    <c:choose>
                      <c:when test="${offer.onCard}">
                        <a class="add-offer-to-card saved" href="#">
                          <span class="not-saved">Save to account</span>
                          <span class="saved">On your account!</span>
                          <span class="expiration">Expires
                            <fmt:formatDate pattern="MM-dd-yyyy" value="${offer.endOn}"/>
                          </span>
                        </a>
                      </c:when>
                      <c:otherwise>
                        <c:url value="/services/ecoupons.html" var="addToCardUrl">
                          <c:param name="couponId" value="${offer.couponId}"/>
                        </c:url>
                        <a data-couponId="${offer.couponId}" class="add-offer-to-card" href="${addToCardUrl}">
                          <span class="not-saved">Save to account</span>
                          <span class="saved">On your account!</span>
                          <span class="expiration">Expires
                            <fmt:formatDate pattern="MM-dd-yyyy" value="${offer.endOn}"/>
                          </span>
                        </a>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </c:if>
                <c:if test="${offer.printable}">
                  <div class="add-to-list-container">
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
                        <a onclick="//_gaq.push(['_trackEvent', '${currentPage.title}', 'AddCouponToCard', '${offer.displayName}']);" class="add-to-print" href="${addItemUrl}">
                          <span class="unlisted">Print with my shopping list</span>
                          <span class="listed">Will print with your list!</span>
                        </a>
                      </c:otherwise>
                    </c:choose>
                  </div>
                  <div class="add-to-list-container">
                    <a class="print-now" id="${offer.couponId}" href="#" onclick="//_gaq.push(['_trackEvent', 'Coupons', 'PrintItem', ${offer.couponId}]);">
                      <span>Print now</span>
                      <span class="expiration">Expires
                        <fmt:formatDate pattern="MM-dd-yyyy" value="${offer.endOn}"/>
                      </span>
                    </a>
                  </div>
                </c:if>
              </div>
            </div>
          </c:forEach>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
  
${offersByType.detectionScript}

${offersByType.printScript}

<script type="text/javascript">
  $(document).ready(function() {
   
    // Append the coupon print iframe, if it's not already present in the page
    if ($("#ci_ic1").length < 1) {
      $("body").append('<iframe width="0" title="coupons" style="width: 0px !important; height: 0px !important; border: none !important;" src="" name="ci_ic1" id="ci_ic1" height="0">IFrames not supported by your browser!</iframe>');
    }
   
    if ($("#printCouponId").length < 1) { 
      $("body").append('<div id="printCouponId" style="display: none;">&nbsp;</div>');
    }

    $('.help').hover(function() {
                       $('#help-tool-tip').show();
                     },
                     function() {
                       $('#help-tool-tip').hide();
                     }
    );

    // Unbind first to prevent multiple handlers
    $('.help').unbind("click").click(function() {
      $('#help-tool-tip').toggle();
    });

    // Unbind first to prevent multiple handlers
    $("a.add-offer-to-card").unbind("click").click(function(evt) {
      evt.preventDefault();
      $t = $(this);

      if (!$t.hasClass('saved')) {

        var $inner = $t.closest('div.coupon-options').siblings('div.coupon-inner');
        $inner.addClass('inprogress');

        $.ajax({type: 'POST',
                cache: false,
                url: '/services/ecoupons.json',
                data: {'couponId': $t.attr('data-couponId'),
                       'action' : 'addOffer'
                },
                success: function(data) {
                  if (data.redirect) {
                    window.location.href = data.redirect;
                  }
                  else {
                    $t.addClass('saved');
                    $t.attr('href','#');
                    $.ajax({url: './view-coupons/jcr:content/rightpar.html',
                            cache: false,
                            dataType: 'html',
                            success: function(data){
                              $('#content-related .parsys.rightpar').html(data);
                            }
                    });
                    $.ajax({url: '/services/shoppinglist.activelist.json',
                            cache: false,
                            dataType: 'json',
                            success: function(data) {
                              refreshShoppingListWidget(data,false);

                              // Update the e-coupons widget count
                              var couponsOnCardElem = $('#couponsOnCard');
                              var couponsOnCardCount = parseInt(couponsOnCardElem.attr('data-couponCount'));
                              var couponsRemainCount = parseInt(couponsOnCardElem.attr('data-couponRemain'));

                              couponsOnCardCount++;
                              couponsRemainCount--;

                              couponsOnCardElem.attr('data-couponCount',couponsOnCardCount);
                              couponsOnCardElem.attr('data-couponRemain',couponsRemainCount);

                              couponsOnCardElem.html(couponsOnCardCount + ' (' + couponsRemainCount + ' Remaining)');
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                              alert("Sorry, An error has occurred while refreshing your shopping list.");
                            }
                    });
                  }

                  $inner.removeClass('inprogress');

              },
              error: function(jqXHR, textStatus, errorThrown) {
                  $inner.removeClass('inprogress');
                  alert("An error has occurred while trying to add this offer to your card.");
              },
              dataType: 'json'
        });
      }
    });

    // Unbind first to prevent multiple handlers
    $("a.print-now").unbind("click").click(function(evt) {
        evt.preventDefault();
        $t=$(this);
        var couponId = $t.attr('id');
        $('#printCouponId').html(couponId);
        ci_CheckInstall();
    });
    
    // Unbind first to prevent multiple handlers
    $("a.add-to-print").unbind("click").click(function(evt) {
        evt.preventDefault();
        $t = $(this);
        if (!$t.hasClass('listed')) {
            var itemHref = $t.attr('href');
            var itemTxt = itemHref.match(/itemTxt=([^&?=]+)/)[1];
            var itemId = itemHref.match(/itemId=([^&?=]+)/)[1];
            var itemExpDate = itemHref.match(/expirationDate=([^&?=]+)/)[1];
            var itemAddInfo = itemHref.match(/itemAdditionalInfo=([^&?=]+)/)?itemHref.match(/itemAdditionalInfo=([^&?=]+)/)[1]:'';

            if(typeof _gaq !== 'undefined'){
                //_gaq.push(['_trackEvent', '${currentPage.title }', 'AddCouponToList', itemTxt]);
            }

            $.ajax({type: 'POST',
                    cache: false,
                    url: '/services/shoppinglist.activelist.json',
                    data: {'itemTxt': itemTxt,
                           'itemQtyTxt': 1,
                           'itemType': 'COUPON',
                           'itemId': decodeURIComponent(itemId).replace(/[+]/g," "),
                           'expirationDate': decodeURIComponent(itemExpDate).replace(/[+]/g," "),
                           'itemSource': 'Coupon',
                           'itemAdditionalInfo': itemAddInfo,
                           'action': 'addItems'
                  },
                  success: function(data) {
                      $t.addClass('listed');
                      $t.attr('href','#');

                      refreshShoppingListWidget(data,false);

                      var addedItem = $('#shopping-list-sidebar-items > tbody > tr').first();
                      glowElement(addedItem);
                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                      alert("An error has occurred while trying to add this item to your shopping list, Please try again.");
                  },
                  dataType: 'json'
            });
        }
    });

  })
  
var bDetectionSuccess = false;
function handlePrinterDetection(code) {
    if (code != 0) {
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
            success: function(data) {
                var sMessage='Click OK to print your coupons.';
                if(data.failedCoupons) {
                    sMessage = 'Some of your coupons were unavailable for printing. You may have already printed them the maximum number of times.\n\nClick OK to print the rest.';
                } 
                
                alert(sMessage);
                var eFrame = document.getElementById("ci_ic1");
                eFrame.src = data.source;
                
            },
            error: function(jqXHR, textStatus, errorThrown) {
                var  sMessag = 'Your coupon(s) were unavailable for printing. You may have already printed this coupon the maximum number of times.';
                alert(sMessage);
            }
        });
        return;
    } else {
        if (bDetectionSuccess) {
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
