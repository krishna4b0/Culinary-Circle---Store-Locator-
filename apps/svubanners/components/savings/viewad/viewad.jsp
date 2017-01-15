<%--
a
  View Ad component

--%>
<%
%><%@include file="/apps/svubanners/global.jsp"%>
<%
%><%@page session="false"
	import="com.svu.bannersites.cq5.components.savings.Viewad"%>
<%
  Viewad viewad = new Viewad(pageContext);
  pageContext.setAttribute("viewad", viewad);

%>
<div id="circular-container-wide-765" class="container tabbed">
	<div class="container-top"></div>
	<h1>
		<span>Weekly Specials</span>
	</h1>
	<a class="hide-for-screen-reader"
		href="${viewad.resultsPath}.html?circularId=${viewad.circularId}&amp;sneakPeek=${viewad.sneakPeek}&amp;storeId=${viewad.storeId}&amp;typeId=${viewad.typeId}">
		View text version of this circular </a>
	<div class="container-inner clearfix">
		<c:choose>
			<c:when test="${viewad.circularPage.imageUrl == null}">
				<p>No Weekly Specials found.</p>
	</div>
</div>
</c:when>
<c:otherwise>
	<c:if test="${viewad.storeCoupons}">
		<script type="text/javascript">
			$(document).ready(
					function() {
						if ($.cookie('OverlayCookie')) {
							$('#fancybox-overlay, #fancybox-wrap').hide();

						} else {

							$.cookie('OverlayCookie', '0', {
								expires : 365
							});

							$('#fancybox-overlay, #fancybox-wrap').show();
							$('#fancybox-overlay,#fancybox-wrap').css(
									'visibility', 'visible');

						}
					});
		</script>

		<div id="fancybox-overlay" class="hide_click"></div>
		<div id="fancybox-wrap">
			<div id="fancybox-outer">
				<div class="fancy-bg" id="fancy-bg-n" style="visibility: hidden;">
				</div>
				<div class="fancy-bg" id="fancy-bg-ne" style="visibility: hidden;"></div>
				<div class="fancy-bg" id="fancy-bg-e" style="visibility: hidden;"></div>
				<div class="fancy-bg" id="fancy-bg-se" style="visibility: hidden;"></div>
				<div class="fancy-bg" id="fancy-bg-s" style="visibility: hidden;"></div>
				<div class="fancy-bg" id="fancy-bg-sw" style="visibility: hidden;"></div>
				<div class="fancy-bg" id="fancy-bg-w" style="visibility: hidden;"></div>
				<div class="fancy-bg" id="fancy-bg-nw" style="visibility: hidden;"></div>
				<div id="fancybox-inner">

					<div id="wrap" class="add-to-list-fancybox">

						<div id="wrap-content">

							<div class="savetocardImg">
								<h2>
									<p>SAVE COUPONS TO YOUR CARD</p>
								</h2>
							</div>
							<div class="RewardCardImg"></div>
						</div>

						<div id="overlay-fancy-box-details">
							<h2>Click and save!</h2>
							<p>Hover over any coupon item in the 
	    weekly ad and click to save the item to your card.</p>
                <p>No need to clip paper coupons, just present your card at checkout.</p>
						</div>


						<img src="/etc/designs/svubanners/master/img/img-coupon-arrow.png"
							class="coupon" alt="Coupon" /> <br class="clear">

					</div>
					
					<button class="hide_click" id="button-close" type="submit"></button>


				</div>
				<div id="fancybox-close" class="hide_click" style="display: block;"></div>
				<script type="text/javascript">
					$(document).ready(function() {
						$(".hide_click").on("click", function() {
							$('#fancybox-overlay, #fancybox-wrap').hide();

						});

					});
				</script>
				<a href="#" id="fancybox-left"><span class="fancy-ico"
					id="fancybox-left-ico"></span></a> <a href="#" id="fancybox-right"><span
					class="fancy-ico" id="fancybox-right-ico"></span></a>
			</div>
		</div>
	</c:if>
	
	<form method="get" action="${viewad.resultsPath}.html">
		<fieldset>
			<input id="inp-circular-search" type="text"
				title="Search all Specials" name="keyword" /> <input type="hidden"
				name="circularId" value="${fn:escapeXml(viewad.circularId)}" /> <input
				type="hidden" name="sneakPeek"
				value="${fn:escapeXml(viewad.sneakPeek)}" /> <input type="hidden"
				name="storeId" value="${fn:escapeXml(viewad.storeId)}" /> <input
				class="button" type="submit" value="Search all Specials"
				onclick="//_gaq.push(['_trackEvent', '${currentPage.title}', 'viewad', 'Search all Specials']);" />
		</fieldset>
	</form>
	<div id="circular-page-view-wide">
		<img usemap="#circularmap" src="${viewad.circularPage.imageUrl}">
		<c:if test="${not empty viewad.circularPage.hotSpots}">
			<map id="circularmap" name="circularmap">
				<c:forEach var="hotspot" items="${viewad.circularPage.hotSpots}">
					<area id="itemId" alt="${hotspot.escapedDescription }"
						coords="${hotspot.coordinates}"
						href="${viewad.viewItemPath}.html?circularId=${viewad.circularId}&sneakPeek=${viewad.sneakPeek}&itemId=${hotspot.itemId}&currentPageNumber=${viewad.currentPageNumber}"
						shape="${hotspot.areaShape}" />
				</c:forEach>
			</map>
		</c:if>
	</div>
	</div>
	</div>
	<div id="circular-detail">
		<c:forEach var="adItem" items="${viewad.circularPage.items}">
			<div style="display: none">
				<div id="item_${adItem.id}" class="circular-special-detail clearfix">
					<div class="col-img" data-image-src="${adItem.imageUrl}">
						<!--
            <img alt="${adItem.description}" src="${adItem.imageUrl}">
            -->
						<img alt="${adItem.description}" src="/libs/cq/ui/resources/0.gif">
					</div>
					<div class="col-guts">
						<h2 class="item-name">${adItem.name}</h2>
						<p class="item-price">${adItem.price}</p>
						<p class="item-qprice">${adItem.priceQualifier}</p>
						<p class="item-desc">${adItem.description}</p>
						<p class="item-expiry">Valid ${adItem.startDate} -
							${adItem.endDate}</p>
						<p>${adItem.finePrint}</p>
						<p class="popup-bottom">
								<a title="Add to My List" href="/services/shoppinglist.activelist.html?action=addItem&itemTxt=${adItem.encodedName }&itemQtyTxt=1&itemId=${adItem.id}&expirationDate=${adItem.endDate}&startDate=${adItem.startDate}&itemType=AD&itemSource=OnSale&itemValue=${adItem.encodedPrice}&itemAdditionalInfo=${adItem.encodedDescription}&productCode=${adItem.productCode}"
									class="add-to-list"></a>
								 
								<c:if test="${not empty adItem.productCode && viewad.storeCoupons}">
									<c:url value="/services/coupons.html" var="addToCardUrl">
										<c:param name="couponId" value="${adItem.productCode}" />
										<c:param name="expirationDate" value="${adItem.endDate}" />
										<c:param name="itemTxt" value="${adItem.encodedName}" />
										<c:param name="itemAdditionalInfo"
											value="${adItem.encodedDescription}" />
										<c:param name="itemId" value="${adItem.id}" />
										<c:param name="startDate" value="${adItem.startDate}" />
									</c:url>
									<a href="${addToCardUrl}" class="add-to-card"></a>
								</c:if>		
													
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="pagination">
		<ul>
			<li class="previous"><c:if
					test="${viewad.currentPageNumber > 1}">
					<a
						href="${currentPage.path}.html?circularId=${fn:escapeXml(viewad.circularId)}&amp;sneakPeek=${fn:escapeXml(viewad.sneakPeek)}&amp;storeId=${fn:escapeXml(viewad.storeId)}&amp;currentPageNumber=${fn:escapeXml(viewad.currentPageNumber) - 1}">
				</c:if>Previous<c:if test="${viewad.currentPageNumber > 1}">
					</a>
				</c:if></li>
			<li class="pages">Page:
				<ol>
					<c:forEach var="pageIndex" begin="1" end="${viewad.totalPages}">
						<c:choose>
							<c:when
								test="${pageIndex < viewad.currentPageNumber + 3 && pageIndex > viewad.currentPageNumber - 3 || pageIndex == viewad.totalPages || pageIndex == 1}">
								<c:choose>
									<c:when test="${viewad.currentPageNumber == pageIndex}">
										<li class="current-page">${pageIndex}
									</c:when>
									<c:otherwise>
										<li><a
											href="${currentPage.path}.html?circularId=${fn:escapeXml(viewad.circularId)}&amp;sneakPeek=${fn:escapeXml(viewad.sneakPeek)}&amp;storeId=${fn:escapeXml(viewad.storeId)}&amp;currentPageNumber=${fn:escapeXml(pageIndex)}">${pageIndex}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when
								test="${pageIndex == viewad.currentPageNumber + 3 || pageIndex == viewad.currentPageNumber - 3}">
								<li>...</li>
							</c:when>
							<c:otherwise>
								<!-- Do nothing -->
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ol>
			</li>
			<li class="next"><c:if
					test="${viewad.currentPageNumber != viewad.totalPages}">
					<a
						href="${currentPage.path}.html?circularId=${fn:escapeXml(viewad.circularId)}&amp;sneakPeek=${fn:escapeXml(viewad.sneakPeek)}&amp;storeId=${fn:escapeXml(viewad.storeId)}&currentPageNumber=${fn:escapeXml(viewad.currentPageNumber) + 1}">
				</c:if>Next<c:if test="${viewad.currentPageNumber != viewad.totalPages}">
					</a>
				</c:if></li>
		</ul>
	</div>
</c:otherwise>
</c:choose>

<script type="text/javascript">
$(document).ready(function() {

	$('body').on('click', 'a.add-to-list', function(evt) {
		evt.preventDefault();
		animateItem($(this));
		addToList($(this));
	});

	$('body').on('click', 'a.add-to-card', function(evt) {
		evt.preventDefault();
		if ($(this).hasClass('added-to-card')) {
			return;
		}
		animateItem($(this));
		addToCard($(this));
	});

	$('#circularmap area').click(function(evt) {
		evt.preventDefault();

		var itemId = "#item_" + $(this).attr('href').match(/itemId=([^&amp;?=]+)/)[1];
		var $item = $(itemId);
		var $itemParent = $item.parent();
		var $itemImageElem = $itemParent.find('div.col-img');
		var itemImageUrl = $itemImageElem.attr('data-image-src');
		$itemImageElem.find('img').attr('src', itemImageUrl);
		var itemImageHtml = $itemImageElem.html();

		// We need to remove and re-add the element in order for the source change to
		// take immediate effect
		$itemImageElem.empty().append(itemImageHtml);

		var parentHtml = $itemParent.html();

		$.fancybox({
			"content" : parentHtml,
			"centerOnScroll" : true,
			"titleShow" : false,
			"transitionIn" : "none",
			"transitionOut" : "none",
			"showCloseButton" : true,
			"showNavArrows" : false,
			"enableEscapeButton" : true,
			"scrolling" : "auto",
			"hideOnOverlayClick" : true,
			"overlayShow" : true
		});

		$('.popup-close').click($.fancybox.close);
	});

	$('area').mouseenter( function() {
		var coords = $(this).attr('coords').split(','); // Left=[0], Top=[1], Right=[2], Bottom=[3]
		var id = coords.join('');
		var itemId = "#item_" + $(this).attr('href').match(/itemId=([^&amp;?=]+)/)[1];
		var $item = $(itemId);

		if ($('#' + id).length == 0) {
			var left = coords[0];
			var top = coords[1];
			var height = coords[3] - top;
			var width = coords[2] - left;
			var divElem = '<div id="' + id + '"><div class="addButtons">' + $($item).find('.popup-bottom').html() + '</div></div>';
			$('#circular-page-view-wide').append(divElem);
			$('#' + id).css({
								top: top + 'px',
								left: left + 'px',
								height: height + 'px',
								width: width + 'px'
							});
			var addButtonsElem = $('#' + id + ' .addButtons');
			var addButtonsHeight = $(addButtonsElem).height();
			var addButtonsWidth = $(addButtonsElem).find('a:first').width();
			$(addButtonsElem).css({
									top: (height / 2) - (addButtonsHeight / 2)	+ 'px',
									left: (width / 2) - (addButtonsWidth / 2) + 'px',
									width: addButtonsWidth + 'px'
								});
			$('#' + id).find('.addButtons').css('display', 'block');
		}
	}).mouseleave( function() {
		var coords = $(this).attr('coords').split(',');
		$('#' + coords.join('')).find('.addButtons').hide();
	});

	$('#circular-page-view-wide').on('mouseover', 'div', function(event) {
		$(this).find('.addButtons').show();
	}).on('mouseout', 'div', function(event) {
		$(this).find('.addButtons').hide();
	});

	function animateItem(jqElem) {
		var dest = $(".widget-shopping-list table");

		if (dest.length == 0) {
			// Empty list
			dest = $(".widget-shopping-list");
		}

		var destPos = dest.position();
		var lastChild = $(dest).find('tr:first');
		var sourceElem = $(jqElem);
		var startPos = $(jqElem).position();
		var targetTop = destPos.top;
		var origHeight = $(sourceElem).height();
		var origWidth = $(sourceElem).width();

		if ($(lastChild).length > 0) {
			targetTop = $(lastChild).position().top	+ lastChild.height() + destPos.top;
		}

		var pathParams = {
			start : {
				x : startPos.left,
				y : startPos.top,
				angle : 331,
				length : 0.7
			},
			end : {
				x : destPos.left - ($(jqElem).offset().left + $(dest).width()),
				y : targetTop - $(jqElem).offset().top,
				angle : 331,
				length : 0.7
			}
		};

		$(jqElem).animate({
			path : new $.path.bezier(pathParams),
			width : 0,
			height : 0
		}, 500, function() {
			$(jqElem).css({
				top: 0,
				left : startPos.left,
				height : origHeight,
				width : origWidth
			});
			
			glowElement(lastChild);
		});
	};

	function addToList($itemAnchor) {
		var itemHref = $itemAnchor.attr('href');
		var itemTxt = itemHref.match(/itemTxt=([^&?=]+)/)[1];
		var itemId = itemHref.match(/itemId=([^&?=]+)/)[1];
		var itemExpDate = itemHref.match(/expirationDate=([^&?=]+)/)[1];
		var itemStartDate = itemHref.match(/startDate=([^&?=]+)/)[1];
		var itemVal = itemHref.match(/itemValue=([^&?=]+)/)[1];
		var itemAddInfo = itemHref.match(/itemAdditionalInfo=([^&?=]+)/) ? itemHref.match(/itemAdditionalInfo=([^&?=]+)/)[1] : '';
		var itemProdCode = itemHref.match(/productCode=([^&?=]+)/) ? itemHref.match(/productCode=([^&?=]+)/)[1] : '';

		if (typeof _gaq !== 'undefined') {
			//_gaq.push([ '_trackEvent',
					'${currentPage.title }',
					'AddCircularItem', itemTxt ]);
		}

		$.ajax({
			type : 'POST',
			cache : false,
			url : '/services/shoppinglist.activelist.json',
			data : {
				'itemTxt' : itemTxt,
				'itemQtyTxt' : 1,
				'itemType' : 'AD',
				'itemId' : decodeURIComponent(
						itemId)
						.replace(/[+]/g, " "),
				'expirationDate' : decodeURIComponent(
						itemExpDate).replace(
						/[+]/g, " "),
				'startDate' : decodeURIComponent(
						itemStartDate).replace(
						/[+]/g, " "),
				'itemSource' : 'OnSale',
				'itemValue' : decodeURIComponent(
						itemVal).replace(/[+]/g,
						" "),
				'itemAdditionalInfo' : itemAddInfo,
				'productCode' : decodeURIComponent(
						itemProdCode).replace(
						/[+]/g, " "),
				'action' : 'addItems'
			},
			success : function(data) {
				//$itemAnchor.attr('href','#');
				//$('#item_' + itemId + ' a.add-to-list').attr('href', '#');
				refreshShoppingListWidget(data,
						false);
				glowElement($('#shopping-list-sidebar-items tbody tr:first td'));
			},
			error : function(jqXHR, textStatus,
					errorThrown) {
				alert("An error has occurred while trying to add this item to your shopping list, Please try again.");
			},
			dataType : 'json'
		});
	};

	function addToCard($itemAnchor) {
		var itemHref = $itemAnchor.attr('href');
		var itemExpDate = itemHref.match(/expirationDate=([^&?=]+)/)[1];
		var couponId = itemHref.match(/couponId=([^&?=]+)/) ? itemHref.match(/couponId=([^&?=]+)/)[1] : '';
		var itemExpDate = itemHref.match(/expirationDate=([^&?=]+)/)[1];
		var itemAddInfo = itemHref.match(/itemAdditionalInfo=([^&?=]+)/) ? itemHref.match(/itemAdditionalInfo=([^&?=]+)/)[1] : '';
		var itemTxt = itemHref.match(/itemTxt=([^&?=]+)/)[1];
		var itemId = itemHref.match(/itemId=([^&?=]+)/)[1];
		var itemStartDate = itemHref.match(/startDate=([^&?=]+)/)[1];

		$.ajax({
			type: 'POST',
			cache: false,
			url: '/services/coupons.json',
			dataType : 'json',
			data: {
				'expirationDate': decodeURIComponent(itemExpDate).replace(/[+]/g, " "),
				'couponId': decodeURIComponent(couponId).replace(/[+]/g, " "),
				'itemText': decodeURIComponent(itemTxt).replace(/[+]/g, " "),
				'itemDescription': decodeURIComponent(itemAddInfo).replace(/[+]/g, " "),
				'itemId': decodeURIComponent(itemId).replace(/[+]/g, " "),
				'startDate': decodeURIComponent(itemStartDate).replace(/[+]/g, " ")
			},
			success: function(data) {
				$itemAnchor.css({
					backgroundImage: "url('/etc/designs/svubanners/cub/images/bg-ecoupon-btn-sprite-cub-rew.png')",
					backgroundPosition: '-2px 95%',
					border: '1px solid #ef3e42'
				}).addClass('added-to-card');
				if (data.redirect) {
					window.location.href = data.redirect;
				} else {
					refreshShoppingListWidget(data, false);
					glowElement($('#shopping-list-sidebar-items tbody tr:first td'));
				}
			},
			error: function() {
				alert("An error has occurred while trying to add this item to your card, Please try again.");
			},
			statusCode: {
				302: function () {
					alert("Ecoupons do not appear to be enabled correctly, please try again.");
				}
			}
		});
	}
});
</script>