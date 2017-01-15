<%--

  Circular Search Results component.

  This component will process a circular search and display the results.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.CircularSearchResult"%><%
	CircularSearchResult circularSearchResult = new CircularSearchResult(pageContext);
	pageContext.setAttribute("circularSearchResult", circularSearchResult);
%>
<c:set var="params" value="?keyword=${circularSearchResult.params.keyword }&category=${circularSearchResult.params.cateogry }&circularId=${circularSearchResult.params.circularId }&sneakPeek=${circularSearchResult.params.sneakPeek }&storeId=${circularSearchResult.params.storeId }" />

<c:choose>
	<c:when test = "${empty circularSearchResult.circularItems.items }">
		No results found!
	</c:when>
	<c:otherwise>
		<div class="clearfix">
			<ul id="coupons-filter-results-info">
				<li class="results-count">Results ${circularSearchResult.startRecord } to ${circularSearchResult.endRecord } of ${circularSearchResult.totalRecordsFound }</li>
				<c:choose>
				<c:when test="${circularSearchResult.displayCount == 25 }">
					<li>Show <a href="${currentPage.path }.html${params }&displayCount=10">10</a></li>
					<li>25</li>
					<li class="last"><a href="${currentPage.path }.html${params }&displayCount=50">50</a></li>
				</c:when>
				<c:when test="${circularSearchResult.displayCount == 50 }">
					<li>Show <a href="${currentPage.path }.html${params }&displayCount=10">10</a></li>
					<li><a href="${currentPage.path }.html${params }&displayCount=25">25</a></li>
					<li class="last">50</li>
				</c:when>
				<c:otherwise>
					<li>Show 10</li>
					<li><a href="${currentPage.path }.html${params }&displayCount=25">25</a></li>
					<li class="last"><a href="${currentPage.path }.html${params }&displayCount=50">50</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
		<div id="specials-list">
			<div id="specials-outer">
			<c:forEach var="circularItem" items="${circularSearchResult.circularItems.items}" varStatus="index">
			<div class="special-outer">
				<div class="special-inner">
					<img src="${circularItem.imageUrl }" alt="" class="img-left framed">
					<div class="clearfix itemlinks">
						<h2><a href="${circularSearchResult.itemURL }.html?circularId=${circularSearchResult.params.circularId }&sneakPeek=${circularSearchResult.params.sneakPeek }&itemId=${circularItem.id}">${circularItem.name }</a></h2>
						<span class="savings">${circularItem.description }</span>
						<p><span>${circularItem.price }</span></p>
						<div>
							
								<c:choose>
									<c:when test="${circularItem.onList }">
									<a class="add-to-list listed" href="#">
										<span class="unlisted">Add to my list</span>
										<span class="listed">Item added to list</span>
									</a>
									</c:when>
									<c:otherwise>
									
									<c:url value="/services/shoppinglist.activelist.html" var="addItemUrl">
											<c:param name="action" value="addItems"/>
											<c:param name="itemTxt" value="${circularItem.encodedName }"/>
											<c:param name="itemQtyTxt" value="1" />
											<c:param name="itemId" value="${circularItem.id }"/>
											<c:param name="expirationDate" value="${circularItem.endDate }"/>
											<c:param name="itemType" value="AD"/>
											<c:param name="itemSource" value="OnSale"/>
											<c:param name="itemValue" value="${circularItem.encodedPrice}"/>
											<c:param name="itemAdditionalInfo" value="${circularItem.encodedDescription }"/>
											<c:param name="productCode" value="${circularItem.productCode }"/>
											<c:param name="resource" value="${currentPage.path }.html?keyword=${circularSearchResult.params.keyword }&category=${circularSearchResult.params.cateogry }&circularId=${circularSearchResult.params.circularId }&sneakPeek=${circularSearchResult.params.sneakPeek }&storeId=${circularSearchResult.params.storeId }" />
									</c:url>								
									<a class="add-to-list" 
										onclick="//_gaq.push('AddToList', 'Weekly Ad', '[${circularItem.encodedName }(${circularItem.id })]');" 
										href="${addItemUrl }">
										<span class="unlisted">Add to my list</span>
										<span class="listed">Item added to list</span>
									</a>
									
					                <c:if test="${not empty circularItem.productCode && circularSearchResult.storeCoupons}">
					                  <c:url value="/services/coupons.html" var="addToCardUrl">
					                    <c:param name="couponId" value="${circularItem.productCode}"/>
					                    <c:param name="expirationDate" value="${circularItem.endDate}"/>
					                    <c:param name="itemTxt" value="${circularItem.encodedName}"/>
					                    <c:param name="itemAdditionalInfo" value="${circularItem.encodedDescription}"/>
					                    <c:param name="itemId" value="${circularItem.id}"/>
					                    <c:param name="startDate" value="${circularItem.startDate}"/>
					                  </c:url>
					                  <a href="${addToCardUrl}" class="add-to-card" ></a>
					                </c:if>
					                
                
									</c:otherwise>
								</c:choose>
							
						</div>
						<div class="expiration">Valid ${circularItem.startDate } - ${circularItem.endDate }</div>
					</div>
				</div>
			</div>
			</c:forEach>
			</div>
		</div>
		
		<c:if test="${circularSearchResult.totalPages != 1 }">
		<div class="pagination">
			<ul>
				<li class="previous"><c:if test="${circularSearchResult.currentPageNumber != 1}"><a href="${params }&displayCount=${circularSearchResult.displayCount }&currentPageNumber=${circularSearchResult.currentPageNumber - 1}"></c:if>Previous<c:if test="${circularSearchResult.currentPageNumber != 1}"></a></c:if></li>
				<li class="pages">Page:
					<ol>
						<c:forEach var="pageIndex" begin="1" end="${circularSearchResult.totalPages }">
							<c:choose>
								<c:when test="${pageIndex < circularSearchResult.currentPageNumber + 3 && pageIndex > circularSearchResult.currentPageNumber - 3 || pageIndex == totalPages || pageIndex == 1}" >
									<c:choose>
										<c:when test="${circularSearchResult.currentPageNumber == pageIndex }">
											<li class="current-page">${pageIndex}
										</c:when>
										<c:otherwise>
											<li>
												<a href="${params }&displayCount=${circularSearchResult.displayCount }&currentPageNumber=${pageIndex}">${pageIndex}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${pageIndex == circularSearchResult.currentPageNumber + 3 || pageIndex == circularSearchResult.currentPageNumber - 3 }">
									<li>...</li>
								</c:when>
								<c:otherwise>
									<!-- Do nothing -->
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ol>
				</li>
				<li class="next"><c:if test="${circularSearchResult.currentPageNumber != circularSearchResult.totalPages}"><a href="${params }&displayCount=${circularSearchResult.displayCount }&currentPageNumber=${circularSearchResult.currentPageNumber + 1}"></c:if>Next<c:if test="${circularSearchResult.currentPageNumber != circularSearchResult.totalPages}"></a></c:if></li>
			</ul>
		</div>
		</c:if>
	</c:otherwise>
</c:choose>	
<script type="text/javascript">
$(document).ready(function(){
	$('a.add-to-list').click(function(evt){
		evt.preventDefault();
		
		$t = $(this);
		if(!$t.hasClass('listed')){
			var itemHref = $t.attr('href');
			var itemTxt = itemHref.match(/itemTxt=([^&?=]+)/)[1];
			var itemId = itemHref.match(/itemId=([^&?=]+)/)[1];
			var itemExpDate = itemHref.match(/expirationDate=([^&?=]+)/)[1];			
			var itemVal = itemHref.match(/itemValue=([^&?=]+)/)[1];
            var itemAddInfo = itemHref.match(/itemAdditionalInfo=([^&?=]+)/)?itemHref.match(/itemAdditionalInfo=([^&?=]+)/)[1]:'';
            var itemProdCode = itemHref.match(/productCode=([^&?=]+)/)?itemHref.match(/productCode=([^&?=]+)/)[1]:'';            
			
			if(typeof _gaq !== 'undefined'){
				//_gaq.push(['_trackEvent', '${currentPage.title }', 'AddCircularItem', itemTxt]);
			}
			
			$.ajax({
				  type: 'POST',
				  cache: false,
				  url: '/services/shoppinglist.activelist.json',
				  data: {
					 'itemTxt': itemTxt,
					 'itemQtyTxt': 1,
					 'itemType': 'AD',
					 'itemId': decodeURIComponent(itemId).replace(/[+]/g," "),
					 'expirationDate': decodeURIComponent(itemExpDate).replace(/[+]/g," "),
					 'itemSource': 'OnSale',
					 'itemValue': decodeURIComponent(itemVal).replace(/[+]/g," "),
                     'itemAdditionalInfo': itemAddInfo,
                     'productCode': decodeURIComponent(itemProdCode).replace(/[+]/g," ")
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
</script>