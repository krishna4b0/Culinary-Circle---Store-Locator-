<%--

  Full Page Quick List Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.FullPageQuickList"%><%
	FullPageQuickList fullPageQuickList = new FullPageQuickList(pageContext);
	pageContext.setAttribute("fullPageQuickList", fullPageQuickList);
%>

<c:choose>
	<c:when test="${empty fullPageQuickList.items && fullPageQuickList.authorMode}">
		<cq:include script="empty.jsp"/>
	</c:when>
	<c:otherwise>
		<div id="summer-quicklist">
			<div class="quicklist-column">
				<form id="frm-ql-1" action="/services/shoppinglist.activelist.html" method="post">
					<div class="quicklist-section-title">
						<h3>${fullPageQuickList.title}</h3>
						<p>${fullPageQuickList.description}</p>
					</div>
					<div class="quicklist-seperator"></div>
					<div class="quicklist-row">
						<c:set var="i" value="0" />
						<c:forEach var="item" items="${fullPageQuickList.items}" varStatus="status">
								<div class="quicklist-item">
									<img src="${item.imagePath}" alt=""><br>
									<input id="ql-item-${status.index }" type="checkbox" name="selections" value="${status.index }">
									<label for="ql-item-${status.index }">${item.title}</label>
									<input type="hidden" name="itemTxt" value="${item.title}" />
									<input type="hidden" name="itemQtyTxt" value="1" />
									<input type="hidden" name="itemType" value="ENTERED" />
									<input type="hidden" name="itemSource" value="Quicklist" />
								</div>
								<c:if test = "${status.count % 3 == 0 }">
								<!-- Every 3 products insert a separator close the quick list row and create a new one. -->
									<div class="quicklist-seperator"></div>
									</div>
									<div class="quicklist-row">
								</c:if>
								<c:set var="i" value="${i + 1}" />
						</c:forEach>
					</div>
					<div class="quicklist-seperator"></div>
					<div class="quicklist-section-buttons" role="navigation">
							<ul class="select-add">
							<li id="left">
								<a id="select-all" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'fullpagequicklist', 'SELECT ALL']);" href="#">SELECT ALL</a>
							</li>
							<li id="right">
								<input id="totalItems" type="hidden" name="totalItems" value="${i }" />
								<input type="hidden" name="forceSelections" value="true" />
								<input type="hidden" name="action" value="addItems" />
								<input type="hidden" name="resource" value="${currentPage.path }.html" />
								<c:if test="${not suppressShoppingList}">
									<input id="add-items" type="submit" value="ADD TO LIST" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'fullpagequicklist', 'ADD TO LIST']);">
								</c:if>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#select-all').click(function (evt) {
		evt.preventDefault();
		$(this).closest("form").find("input:checkbox").each(function() {
			this.checked = true;
			this.setAttribute("checked", true);
		});
		return false;
	});
	
	
	$('#add-items').click(function(evt){
		evt.preventDefault();
		
		if(typeof _gaq !== 'undefined'){
			var frmDataArray = $('#frm-ql-1').serializeObject();
			var selectedItems = frmDataArray.selections;
			var itemTxts = frmDataArray.itemTxt;
			for(var i=0;i<selectedItems.length;i++) {
				var selectionIndex = selectedItems[i];
				var selectedItemName = encodeURI(itemTxts[selectionIndex]);
				//_gaq.push(['_trackEvent', '${currentPage.title }', 'Quicklist', selectedItemName]);
			}
		}
		
		$.ajax({
			  type: 'POST',
			  cache: false,
			  url: '/services/shoppinglist.activelist.json',
			  data: encodeURI($('#frm-ql-1').serialize()),
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