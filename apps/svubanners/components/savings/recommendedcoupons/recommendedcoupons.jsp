<%--

  Recommended Coupons Component - includes eCoupons that are recommended by SVU.
  Author: Tommy Miller & Todd Guerra

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.RecommendedCoupons"%><%
    RecommendedCoupons recommendedCoupons = new RecommendedCoupons(pageContext);
    pageContext.setAttribute("recommendedCoupons", recommendedCoupons);
%>

<c:choose>

    <c:when test="${(recommendedCoupons.anonymous && recommendedCoupons.loyaltyCookieNotPresent) || recommendedCoupons.authorMode }">

        <div class="container">
        <h2>Log in for recommended offers, personalized for you.</h2>
        <a><span class="help"></span></a>
        <div id="help-tool-tip" class="helpHover" style="top: 15px;">
           <div id="help-tool-tip-content" class="drop-shadow">
             <p> ${recommendedCoupons.toolTip} </p>
            </div>
         </div> 
        <a class="loginButton" href="${recommendedCoupons.loginPath}.html">Login or Signup ></a>
    </div>

    </c:when>
    <c:otherwise>
        <div class="container active">
            <h1>Coupons</h1>
            <div class="columns">
                <div class="col1">
                    <h2>Your Recommended Offers</h2>
                </div>
                <a><span class="help"></span></a>
                <div id="help-tool-tip" class="helpHover" style="top: 85px;">
                    <div id="help-tool-tip-content" class="drop-shadow">
                        <p> ${recommendedCoupons.toolTip} </p>
                    </div>
                </div>                  
            </div>
        </div>
        
        <div id="ecoupon-list">
        <c:if test = "${not empty recommendedCoupons.errorMessage }">
            	<p>${recommendedCoupons.errorMessage }</p>
        </c:if>
        
        <c:choose>
            <c:when test = "${empty recommendedCoupons.coupons}">
                Sorry, no recommended coupons at this time.
            </c:when>
            
            <c:otherwise>
                <div id="coupons-outer">
                <c:forEach var="coupon" items="${recommendedCoupons.coupons}">
                    <div class="coupon-outer">
                        <div class="coupon-inner">
                            <img src="${coupon.logoUrl}" class="img-left framed">
                            <div class="clearfix itemlinks">
                                <h3>${coupon.displayName}</h3>
                                <p><strong>${coupon.savingsValueStatement}</strong> ${coupon.purchaseDescription }</p>
                            </div>
                        </div>
                        <div class="coupon-options">
                            <c:if test="${coupon.cardable }">
                                <div class="add-to-list-container">
                                <c:choose>
                                    <c:when test="${coupon.onCard }">
                                        <a class="add-offer-to-card saved" href="#">
                                            <span class="not-saved">Save to account</span>
                                            <span class="saved">On your card!</span>
                                            <span class="expiration">Expires <fmt:formatDate pattern="MM-dd-yyyy" value="${coupon.endOn }"/></span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="/services/ecoupons.html" var="addToCardUrl">
                                            <c:param name="couponId" value="${coupon.couponId }"/>
                                            <c:param name="loyaltyCardNumber" value="${recommendedCoupons.loyalty}" />
                                        </c:url>
                                        <a data-couponId="${coupon.couponId }" data-card="${recommendedCoupons.loyalty}" class="add-offer-to-card" href="${addToCardUrl }">
                                            <span class="not-saved">Save to account</span>
                                            <span class="saved">On your card!</span>
                                            <span class="expiration">Expires <fmt:formatDate pattern="MM-dd-yyyy" value="${coupon.endOn }"/></span>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                </div>
                            </c:if>
                            <c:if test="${coupon.printable and not suppressShoppingList}">
                                <div class="add-to-list-container">
                                <c:choose>
                                    <c:when test="${coupon.onList }">
                                        <a class="add-to-print listed" href="#">
                                            <span class="unlisted">Print with my shopping list</span>
                                            <span class="listed">Will print with your list!</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatDate pattern="MM/dd/yyyy" value="${coupon.endOn }" var="formattedEndDate" />
                                        <c:url value="/services/shoppinglist.activelist.html" var="addItemUrl">
                                            <c:param name="action" value="addItem"/>
                                            <c:param name="itemTxt" value="${coupon.displayName}"/>
                                            <c:param name="itemQtyTxt" value="1" />
                                            <c:param name="itemId" value="${coupon.couponId }"/>
                                            <c:param name="expirationDate" value="${formattedEndDate }"/>
                                            <c:param name="itemType" value="COUPON"/>
                                            <c:param name="itemSource" value="Coupon"/>
                                            <c:param name="itemValue" value="${coupon.value}"/>
                                            <c:param name="itemAdditionalInfo" value="${coupon.savingsValueStatement} -- ${coupon.purchaseDescription }"/>
                                            <c:param name="resource" value="${currentPage.path }.html?keyword=${couponSearchResults.params.keyword }&category=${couponSearchResults.params.category }&sortDirection=${couponSearchResults.sortDirection }&sortProperty=${couponSearchResults.sortProperty }" />
                                        </c:url>
                                        <a onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'AddCouponToCard', '${coupon.displayName}']);" class="add-to-print" href="${addItemUrl }">
                                            <span class="unlisted">Print with my shopping list</span>
                                            <span class="listed">Will print with your list!</span>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                </div>
                                <div class="add-to-list-container">
                                    <a class="print-now" id="${coupon.couponId}" href="#" onclick="//_gaq.push(['_trackEvent', 'Coupons', 'PrintItem', ${coupon.couponId}]);">
                                        <span>Print now</span>
                                        <span class="expiration">Expires <fmt:formatDate pattern="MM-dd-yyyy" value="${coupon.endOn }"/></span>
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
            </c:otherwise>
    

</c:choose>

<script type="text/javascript">
$(document).ready(function() {
    $('.help').hover(function() {
        $('#help-tool-tip').show();     
    }, function() {
        $('#help-tool-tip').hide();
    });

    $('.help').click(function() {
        $('#help-tool-tip').toggle();   
    });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
    $('a.add-offer-to-card').click(function(evt){
        evt.preventDefault();
        $t=$(this);
        if($t.hasClass('saved')){
            return;
        }
        
        var $inner = $t.closest('div.coupon-options').siblings('div.coupon-inner');
        $inner.addClass('inprogress');
        
        $.ajax({
            type: 'POST',
              cache: false,
              url: '/services/ecoupons.json',
              data: {
                 'couponId': $t.attr('data-couponId'),
                 'action' : 'addOffer',
                 'loyaltyCardNumber' : $t.attr('data-card')
              },
              success: function(data){
                  if(data.redirect) {
                      window.location.href = data.redirect;
                  } else {
                      $t.addClass('saved');
                      $t.attr('href','#');
                      $.ajax({
                            url: './view-coupons/jcr:content/rightpar.html',
                            cache: false,
                            dataType: 'html',
                            success: function(data){
                                $('#content-related .parsys.rightpar').html(data);
                            }
                      });
                      $.ajax({
                            url: '/services/shoppinglist.activelist.json',
                            cache: false,
                            dataType: 'json',
                            success: function(data){
                                refreshShoppingListWidget(data,false);  
                                
                                //update the ecoupons widget count
                                  //get the counts
                                  var couponsOnCardElem = $('#couponsOnCard');
                                  var couponsOnCardCount = parseInt(couponsOnCardElem.attr('data-couponCount'));
                                  var couponsRemainCount = parseInt(couponsOnCardElem.attr('data-couponRemain'));

                                  //increment/decrement
                                  couponsOnCardCount++;
                                  couponsRemainCount--;

                                  //update the data attributes with the new values
                                  couponsOnCardElem.attr('data-couponCount',couponsOnCardCount);
                                  couponsOnCardElem.attr('data-couponRemain',couponsRemainCount);

                                  //now update the html display string
                                  couponsOnCardElem.html(couponsOnCardCount + ' (' + couponsRemainCount + ' Remaining)');
                                  //end update the ecoupons widget
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
    });
})
</script>
