<%--

  Shopping List Carousel component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.ShoppingListCarousel"%><%
	ShoppingListCarousel shoppingListCarousel = new ShoppingListCarousel(pageContext);
	pageContext.setAttribute("shoppingListCarousel", shoppingListCarousel);
%>

<c:choose>
    <c:when test="${empty shoppingListCarousel.slides && shoppingListCarousel.authorMode}">
        <cq:include script="empty.jsp" />
    </c:when>
    <c:otherwise>
		<form id="frm-carousel-detail" action="/services/shoppinglist.activelist.html" method="post" >
			<div class="${shoppingListCarousel.wrapperClass}-outer ${shoppingListCarousel.backgroundCssId}">
				<h5>${shoppingListCarousel.title}</h5>
				<div class="${shoppingListCarousel.wrapperClass}-prev disabled">&nbsp;</div>
				<div class="${shoppingListCarousel.wrapperClass}">
					<ul id="mycarousel" class="carousel">
						<c:forEach var="slide" items="${shoppingListCarousel.slides}" varStatus="status">
							<c:if test="${not empty slide.imagePath}">
								<li style="overflow: hidden; float: none; width: 147px; height: 167px;">
									 <c:choose>
                						<c:when test="${not empty slide.path}">
                						<a href="${slide.path}" tabindex="-1" <c:if test="${not empty slide.alt }"> class="carousel-tool-tip"</c:if>>
                						</c:when>
                						<c:otherwise>
                						<a href="#" tabindex="-1" <c:if test="${not empty slide.alt }"> class="carousel-tool-tip"</c:if>>
                						</c:otherwise>
                					</c:choose>
									
										<img src="${slide.imagePath}" style=" height: 145px; width: 145px; border: medium none;">
									</a>
									<input type="checkbox" name="selections" title="${slide.alt }" value="${status.index}">
									<label style=" top: -30px; left: 25px; font-weight: bold; font-size: 14px; position: relative;">${slide.title}</label>
									<input type="hidden" name="itemTxt" value="${slide.title}" />
									<input type="hidden" name="itemQtyTxt" value="1" />
									<input type="hidden" name="itemType" value="ENTERED" />
									<input type="hidden" name="itemSource" value="Carousel" />
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="${shoppingListCarousel.wrapperClass }-next">&nbsp;</div>
				<div id="add-to-list">
					<c:if test="${not suppressShoppingList}">
						<input id="add-items" type="submit" value="ADD TO LIST">
					</c:if>
				</div>
			</div>
			<c:if test="${not suppressShoppingList}">
				<input type="hidden" name="forceSelections" value="true" />
				<input type="hidden" name="action" value="addItems" />
				<input type="hidden" name="resource" value="${currentPage.path }.html" />
			</c:if>
		</form>
    </c:otherwise>
</c:choose>

<div id="help-tool-tip" class="carousel">
	<div id="help-tool-tip-content" class="drop-shadow">This is a tool tip</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
    
	$('#add-items').click(function(evt){
		evt.preventDefault();
		
		if(typeof _gaq !== 'undefined'){
			var frmDataArray = $('#frm-carousel-detail').serializeObject();
			var selectedItems = frmDataArray.selections;
			var itemTxts = frmDataArray.itemTxt;
			for (var i = 0; i < selectedItems.length; i++) {
				var selectionIndex = selectedItems[i];
				var selectedItemName = itemTxts[selectionIndex];
				//_gaq.push(['_trackEvent', '${currentPage.title }', 'ShoppingListCarousel', selectedItemName]);
			}
		}
		
		$.ajax({
			  type: 'POST',
			  cache: false,
			  url: '/services/shoppinglist.activelist.json',
			  data: encodeURI($('#frm-carousel-detail').serialize()),
			  success: function(data){
				  refreshShoppingListWidget(data,false);
			  },
			  error: function(jqXHR, textStatus, errorThrown) {
		  		  alert("An error has occurred while trying to add this item to your shopping list, Please try again.");	
			  },
			  dataType: 'json'
		});
	});
});
</script>