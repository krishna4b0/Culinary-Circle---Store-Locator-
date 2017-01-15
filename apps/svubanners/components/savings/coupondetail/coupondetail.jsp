<%--

  Coupon Detail Page component.

  

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
	// TODO add you code here
%><%@page session="false"
	import="com.svu.bannersites.cq5.components.savings.CouponSearchResults,com.adobe.granite.security.user.UserProperties,java.util.Calendar,java.util.Date"
	%>
<%
	CouponSearchResults couponSearchResults = new CouponSearchResults(pageContext);
	pageContext.setAttribute("couponSearchResults", couponSearchResults);
   
    Calendar dateUtil = Calendar.getInstance();
%>

			<div>
				<div id="ecoupon-list" <c:if test="${couponSearchResults.grid }">class="grid"</c:if> >
					<c:forEach var="coupon" items="${couponSearchResults.coupons}" varStatus="status">
                        <c:set var="endOn" value="${coupon.endOn}"/>
                        <%
                           dateUtil.setTime((Date)pageContext.getAttribute("endOn"));
                           dateUtil.add(Calendar.HOUR, -1);
                           pageContext.setAttribute("endOn", dateUtil.getTime());
                        %>
                        <c:if test="${status.first}">
						<div class="coupon-outer">
							<div class="coupon-anchor-container">
								<div class="coupon-inner">
									<c:if test="${not couponSearchResults.grid }">
										<img class="coupon-img" width="80" src="${coupon.logoUrl}" alt="${coupon.displayName}" class="img-left framed">
									</c:if>
									<div class="clearfix itemlinks">
										<h3 class="coupon-name">${coupon.displayName}</h3>
										<c:if test="${couponSearchResults.grid }">
											<img class="coupon-img" width="80" src="${coupon.logoUrl}" alt="" class="img-left framed">
										</c:if>
										<p class="coupon-description">
											<strong>${coupon.savingsValueStatement}</strong>
											${coupon.purchaseDescription }
										</p>
										<p class="coupon-date">
	                                        <span class="expiration">Valid <fmt:formatDate pattern="MM/dd/yy" value="${coupon.startOn}" />
	                                            - <fmt:formatDate pattern="MM/dd/yy" value="${endOn}" />
											</span>
										</p>
									</div>
								</div>
							</div>
							<div class="coupon-options">
								<c:if test="${coupon.cardable }">
									<div class="add-to-list-container">
										<c:choose>
											<c:when test="${coupon.onCard }">
												<a class="add-to-card saved" href="#"> <span
													class="not-saved">Save to account</span> <span class="saved">On
														your card!</span>
												</a>
											</c:when>
											<c:otherwise>
												<c:url value="/services/ecoupons.html" var="addToCardUrl">
													<c:param name="couponId" value="${coupon.couponId }" />
												</c:url>
												<a data-couponId="${coupon.couponId }" class="add-to-card"
													href="${addToCardUrl }">
													<span class="not-saved">Save to account</span>
													<span class="inprogress">Adding to card</span>
													<span class="saved">On your card!</span>
												</a>
											</c:otherwise>
										</c:choose>
									</div>
								</c:if>
								<c:if test="${coupon.printable && !coupon.cardable }">
									<div class="add-to-list-container">
										<c:choose>
											<c:when test="${coupon.onList }">
												<a class="add-to-print listed" href="#"> <span
													class="unlisted">Print with my shopping list</span> <span
													class="listed">Will print with your list!</span>
												</a>
											</c:when>
											<c:otherwise>
												<fmt:formatDate pattern="MM/dd/yyyy"
													value="${endOn}" var="formattedEndDate" />
												<c:url value="/services/shoppinglist.activelist.html"
													var="addItemUrl">
													<c:param name="action" value="addItem" />
													<c:param name="itemTxt" value="${coupon.displayName}" />
													<c:param name="itemQtyTxt" value="1" />
													<c:param name="itemId" value="${coupon.couponId }" />
													<c:param name="expirationDate" value="${formattedEndDate }" />
													<c:param name="itemType" value="COUPON" />
													<c:param name="itemSource" value="Coupon" />
													<c:param name="itemValue" value="${coupon.value}" />
													<c:param name="itemAdditionalInfo"
														value="${coupon.savingsValueStatement} -- ${coupon.purchaseDescription }" />
													<c:param name="resource"
														value="${currentPage.path }.html?keyword=${couponSearchResults.keyword }&category=${couponSearchResults.category }&type=${couponSearchResults.type }&sortDirection=${couponSearchResults.sortDirection }&sortProperty=${couponSearchResults.sortProperty }" />
												</c:url>
												<a
													onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'AddCouponToCard', '${coupon.displayName}']);"
													class="add-to-print" href="${addItemUrl }"> <span
													class="unlisted">Print with my shopping list</span> <span
													class="listed">Will print with your list!</span>
												</a>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="add-to-list-container">
										<a class="print-now" id="${coupon.couponId}" href="#"
											onclick="//_gaq.push(['_trackEvent', 'Coupons', 'PrintItem', ${coupon.couponId}]);">
											<span>Print now</span>
										</a>
									</div>
								</c:if>

								<p class="legalterms-container">
									<c:if test="${coupon.hasLegalTerms}">
										<a class="legalTerms" 
											data-couponinfo="/services/couponterms?couponId=${coupon.couponId}" data-couponimg="${coupon.logoUrl}"
											href="#">Details</a>
									</c:if>
								</p>

							</div>
						</div>
                        </c:if>
                        <c:if test="${!status.first}">
        					<div class="coupon-outer" style="display:none">
                            </div>
    					</c:if>		
					</c:forEach>
				</div>


<iframe width="0" title="coupons"
	style="width: 0px !important; height: 0px !important; border: none !important;"
	src="" name="ci_ic1" id="ci_ic1" height="0"> IFrame's not
	supported by your browser! </iframe>
${couponSearchResults.detectionScript }
${couponSearchResults.printScript }

<script>
$(document).ready(function(){
	
	// switching between print coupons and add to account coupons

	// TODO:  need noncarded banner urls

	var printAtHomeBannerURL = function () {
		var url = '';
		switch (SVUMaster.banner) {
			case 'cub':
				url = '62';
				break;
			case 'farmfresh':
				url = '66';
				break;
			case 'shoppers':
				url = '617';				
				break;
			case 'shopnsave':
				url = '288';
				break;
			case 'hornbachers':
				url = '313';
				break;	
			case 'rainbowfoods':
				url = '1387';
				break;
			case 'cmwa':
				url = '189';
				break;
		}
		return url;
	};

	$('select#coupon-type').on('change', function () {
		if ($(this).val() === 'BarcodeSettlementOffer') {
			var iframe = '<iframe id="print-coupons" src="https://www.hopster.com/offers/retailer/' + printAtHomeBannerURL() + '?secure=true" height="850" width="765" scrolling="no"></iframe>';
			$('div.couponsearchform').css('visibility', 'hidden');
			$('div#frm-coupon-search-options').add('.sort-col').add('#coupons-filter-results-info').add('.results-count').add('.results-count + div').add('input#searchCoupons').not('#frm-coupon-search-options').fadeOut(200, function () {
				$(this).remove();
			});
			$('div.couponsearchresults').append(iframe);
		} else {
			window.location.reload();
		}
	});

	// this toggle is in author en page at the bottom of site config.  As banners get add-to-account turned on that will need to be toggled and this will work fine.

	if (!SVUMaster.isLoadToAccount) {
		$('select#coupon-type').val('BarcodeSettlementOffer').trigger('change').find('[value="LoyaltyOffer"]').remove();
	}

	// add to card/list stuff

	$('a.add-to-card').on('click', function(event) {
		event.preventDefault();
		var $this = $(this);
		SVUMaster.couponAddToShoppingList($this);
		//if this is saved OR they've been prompted for cardless id OR coupon sign in AND they're not logged in, do nothing
		if ($this.hasClass('saved') || $.cookie('promptedForCardlessIDinput') || $.cookie('promptedForCouponSignin') && !$.cookie('login-token') && !$.cookie('social-login')) {
				if ($.cookie('login-token') || $.cookie('social-login')){
					//i think there's a problem with the or's and the and's and the jello pudding
					SVUMaster.couponAddToCard($this.attr('data-couponId'));
				}
			return;
		} else if (!$.cookie('login-token') && !$.cookie('promptedForCouponSignin') && !$.cookie('social-login')) {
			//if they're not logged in and they haven't been prompted for coupon sign in..
			$.cookie('promptedForCouponSignin', true, {path: '/'});
			SimpleSignup.app = new SimpleSignup.Signin();
			SimpleSignup.app.data.couponClicked = $this.attr('data-couponId');
			SimpleSignup.app.init();
		} else if ($.cookie('login-token') && !$.cookie('promptedForCardlessIDinput') && !$.cookie('rewardsNumberCookie') && !$.cookie('loggedInAssociate') || $.cookie('social-login') && !$.cookie('promptedForCardlessIDinput') && !$.cookie('rewardsNumberCookie') && !$.cookie('loggedInAssociate')) {
			//they're logged in and not yet prompted for cardless ID and no rewards # and not a logged in associate
			if (SVUMaster.banner === 'cub') {
				SimpleSignup.app = new SimpleSignup.SetAltIDNumber();
			} else {
				SimpleSignup.app = new SimpleSignup.SetAltIDNumber({isRewards: true});
			}

			//using this way instead
			SVUMaster.couponAddToCard($this.attr('data-couponId'));

			// SimpleSignup.app.data.couponClicked = $this.attr('data-couponId');
			SimpleSignup.app.init();
		} else {
			SVUMaster.couponAddToCard($this.attr('data-couponId'));
		}
	});

	$('a.add-to-card.saved').each(function(index, el) {
		SVUMaster.couponFadeInSavedImmediate($(el));
	});

	equalizeCouponGrid();
	
	$('a.print-now').click(function(evt){
		evt.preventDefault();
		$t=$(this);
		var couponId = $t.attr('id');
		$('#printCouponId').html(couponId);	
		ci_CheckInstall();
	});
	
	$('a.add-to-print').click(function(evt){
		evt.preventDefault();
		$t = $(this);
		if(!$t.hasClass('listed')){
			var itemHref = $t.attr('href');
			var itemTxt = itemHref.match(/itemTxt=([^&?=]+)/)[1];
			var itemId = itemHref.match(/itemId=([^&?=]+)/)[1];
			var itemExpDate = itemHref.match(/expirationDate=([^&?=]+)/)[1];
			var itemAddInfo = itemHref.match(/itemAdditionalInfo=([^&?=]+)/)?itemHref.match(/itemAdditionalInfo=([^&?=]+)/)[1]:'';
			var itemVal = itemHref.match(/itemValue=([^&?=]+)/)[1];
			
			if(typeof _gaq !== 'undefined'){
				//_gaq.push(['_trackEvent', '${currentPage.title }', 'AddCouponToList', itemTxt]);
			}
			
			$.ajax({
				  type: 'POST',
				  cache: false,
				  url: '/services/shoppinglist.activelist.json',
				  data: {
					 'itemTxt': itemTxt,
					 'itemQtyTxt': 1,
					 'itemType': 'COUPON',
					 'itemId': decodeURIComponent(itemId).replace(/[+]/g," "),
					 'expirationDate': decodeURIComponent(itemExpDate).replace(/[+]/g," "),
					 'itemSource': 'Coupon',
					 'itemAdditionalInfo': itemAddInfo,
					 'itemValue': decodeURIComponent(itemVal).replace(/[+]/g," "),
					 'action': 'addItems'
				  },
				  success: function(data){
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
        		storeId: ${couponSearchResults.storeId }
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

function ci_InstallCouponPrinter(){
	var container = document.getElementsByTagName('body')[0];
	var ciFrame = document.createElement('iframe');
	ciFrame.setAttribute('width', '1');
	ciFrame.setAttribute('height', '1');
	ciFrame.setAttribute('name', 'ciFrame');
	ciFrame.setAttribute('id', 'ciFrame');
	ciFrame.setAttribute('src', window.location.protocol + '//cdn.coupons.com/ftp.coupons.com/Partners/CouponPrinter.exe');
	container.appendChild(ciFrame);
}
</script>
