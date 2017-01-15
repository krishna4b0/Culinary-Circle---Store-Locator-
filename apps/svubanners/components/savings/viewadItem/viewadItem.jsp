<%--

  viewad item component.

  

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.ViewadItem"%><%
	
	ViewadItem viewadItem = new ViewadItem(pageContext);
	pageContext.setAttribute("viewadItem", viewadItem);
%>
<div class="container tabbed">
	<div class="container-top">&nbsp;</div>
	<c:if test="${not empty viewadItem.errorMessages }">
	<div id="error-message-container" style="display: block;">
		<ul>
			<c:forEach var="message" items="${viewadItem.errorMessages }">
				<li>${message }</li>
			</c:forEach>
		</ul>
	</div>
</c:if>
	<h1><span>Weekly Ad Item Details</span></h1>
	<div style=" width: 540px;" class="container-inner">
		<form method="GET" id="frm-simple-savings-item-detail" class="frm-simple" action="${viewadItem.searchPath }.html">
			<label for="inp-search-coupons" class="wai">Search:</label>
			<input value="Search All Specials" type="text" title="Search all specials" 
				onfocus="if (this.value==this.defaultValue) this.value=''; else this.select()" 
				onblur="if (!this.value) this.value=this.defaultValue" 
				name="searchText" id="inp-search-coupons">
			<button type="submit" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'viewadItem', 'Submit']);">Submit</button>
		</form>
		<div class="container-savings-item-detail clearfix">
			<div class="continue-browsing">
				<a href="${viewadItem.circularPath }.html?circularId=${viewadItem.circularId}&sneakPeek=${viewadItem.sneakpeek }&currentPageNumber=${viewadItem.pageNumber }" class="back">Continue Browsing</a>
			</div>
			<div class="clearfix">
				<div class="col-item">
					<img title="${viewadItem.circularItem.name }" src="${viewadItem.circularItem.imageUrl }" alt="">
				</div>
				<div class="col-details">
					<h3>${viewadItem.circularItem.name }</h3>
					<div class="model.item-price">${viewadItem.circularItem.price }</div>
					<p class="desc">${viewadItem.circularItem.description }</p>
					<div class="add-print">
						<c:choose>
							<c:when test="${not viewadItem.circularItem.onList }">
								
								<c:url value="/services/shoppinglist.activelist.html" var="addItemUrl">
									<c:param name="action" value="addItems"/>
									<c:param name="itemTxt" value="${viewadItem.circularItem.encodedName }"/>
									<c:param name="itemQtyTxt" value="1" />
									<c:param name="itemId" value="${viewadItem.circularItem.id }"/>
									<c:param name="expirationDate" value="${viewadItem.circularItem.endDate }"/>
									<c:param name="startDate" value="${viewadItem.circularItem.startDate }"/>
									<c:param name="itemType" value="AD"/>
									<c:param name="itemSource" value="OnSale"/>
									<c:param name="itemValue" value="${viewadItem.circularItem.encodedPrice}"/>
									<c:param name="itemAdditionalInfo" value="${viewadItem.circularItem.encodedDescription }"/>
									<c:param name="productCode" value="${viewadItem.circularItem.productCode }"/>
									<c:param name="resource" value="${currentPage.path }.html?circularId=${viewadItem.circularId}&sneakPeek=${viewadItem.sneakpeek }&currentPageNumber=${viewadItem.pageNumber }&itemId=${viewadItem.circularItem.id }"/>
								</c:url>								
								<a href="${addItemUrl }" class="add-to-list">
							</c:when>
							<c:otherwise>
							<a href="#" class="add-to-list listed">
							</c:otherwise>
						</c:choose>
							<span class="unlisted">Add to my list</span>
							<span class="listed">Item added to list</span>
						</a>
						 
						<c:if test="${not empty viewadItem.circularItem.productCode && viewadItem.storeCoupons }">
							<c:choose>
								<c:when test="${not viewadItem.circularItem.onList }">
									<c:url value="/services/coupons.html" var="addToCardUrl">
									<c:param name="couponId" value="${viewadItem.circularItem.productCode }"/>
									<c:param name="expirationDate" value="${viewadItem.circularItem.endDate }"/>
									</c:url>
									<a class="add-to-list" href="${addToCardUrl }">
									<span class="unlisted">Add to my Card</span>
									<span class="listed">Item added to Card</span>
									</a>
							</c:when>
							<c:otherwise>
							<a href="#" class="add-to-list listed">
							</c:otherwise>
							</c:choose>
						</c:if>
						
					</div>
					<div class="expiration right">Valid ${viewadItem.circularItem.startDate } - ${viewadItem.circularItem.endDate }</div>
				</div>
			</div>
		</div>
	</div>
</div>
<p></p>
<div xmlns="" name="DivControl4278" id="divcontainer1">
	<div>
		<div class="footnote">
		${viewadItem.legalese }
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('a.add-to-list').click(function(evt){
		evt.preventDefault();
		
		$t = $(this);
		if(!$t.hasClass('listed')){
			
			if(typeof _gaq !== 'undefined'){
				//_gaq.push(['_trackEvent', '${currentPage.title }', 'AddCircularItem', '${viewadItem.circularItem.encodedName }']);
			}
			
			$.ajax({
				  type: 'POST',
				  cache: false,
				  url: '/services/shoppinglist.activelist.json',
				  data: {
					 'itemTxt': encodeURI('${viewadItem.circularItem.encodedName }'),
					 'itemQtyTxt': '1',
					 'itemType': 'AD',
					 'itemId': '${viewadItem.circularItem.id }',
					 'expirationDate': '${viewadItem.circularItem.endDate }',
					 'startDate': '${viewadItem.circularItem.startDate }',
					 'itemSource': 'OnSale',
					 'itemValue': '${viewadItem.circularItem.encodedPrice }',
					 'itemAdditionalInfo': '${viewadItem.circularItem.encodedDescription }',
					 'productCode': '${viewadItem.circularItem.productCode }',
					 'action': 'addItems'
				  },
				  success: function(data){
					  $t.addClass('listed');
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
</script>