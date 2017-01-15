<%--

  Suggested Shopping List Manager Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.SuggestedListManager,com.day.cq.wcm.api.components.IncludeOptions,com.day.cq.wcm.api.WCMMode"%><%
	SuggestedListManager suggestedListManager = new SuggestedListManager(pageContext);
	pageContext.setAttribute("suggestedListManager", suggestedListManager);
%>

<div class="container-wide tabbed">
	<div class="tabs">
		<h1><a href="${suggestedListManager.currentListPath}.html"><span>Current List</span></a></h1>
		<h1><span>Suggested Lists</span></h1>
	</div>
	<div class="container-top-padder">
		<div class="container-top-move">&nbsp;</div>
		<div class="container-inner typical">
			<form action="/services/shoppinglist.activelist.html" id="frm-shopping-list" method="post">
				<div class="container-shopping clearfix">
					<div class="shopping-list-container" style=" height: auto;">
						<div class="shopping-list-sel">
							<c:if test="${not empty suggestedListManager.suggestedLists}">
								<ul id="col-1">
									<c:forEach var="page" items="${suggestedListManager.suggestedLists}" varStatus="status">
										<c:if test="${status.index % 2 == 0 }">
										<li>
											<a href="${currentPage.path}.${page.key }.html">${page.value}</a>
										</li>
										</c:if>
									</c:forEach>
								</ul>
								<ul id="col-2">
									<c:forEach var="page" items="${suggestedListManager.suggestedLists}" varStatus="status">
										<c:if test="${status.index % 2 != 0 }">
										<li>
											<a href="${currentPage.path}.${page.key }.html">${page.value}</a>
										</li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
						</div>
						<div class="shopping-bubble-container">
							<div class="shopping-bubble">
								<span class="featured">Featured List</span>
								<h4>${suggestedListManager.featuredListPageTitle}</h4>
							</div>
						</div>
					</div>
					<%
						//force smae context so wrapper divs aren't rendered for sub components inside the container
						IncludeOptions.getOptions(request, true).forceSameContext(true);
						        //get the current wcm mode, set it to disables to include the suggested list
						WCMMode mode = WCMMode.fromRequest(request);
						WCMMode.DISABLED.toRequest(request);
					%>
					<sling:include path="${suggestedListManager.featuredListPage.path}" replaceSelectors="list" /> 
					<%
						//reset the wcm mode for the rest of the page
						mode.toRequest(request);
					%>
					<c:if test="${not suppressShoppingList}">
						<input type="hidden" name="forceSelections" value="true" />
						<input type="hidden" name="action" value="addItems" />
						<input type="hidden" name="resource" value="${currentPage.path }.html" />
					
						<button value="Copy Selected to Current List" type="submit" class="button copy_selected-to_current_list" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'suggestedlistmanager', 'Copy Selected to Current Shopping List']);">Copy Selected to Current Shopping List</button>
					</c:if>	
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('button.copy_selected-to_current_list').click(function(evt){
		evt.preventDefault();
		
		if(typeof _gaq !== 'undefined'){
			var frmDataArray = $('#frm-shopping-list').serializeObject();
			var selectedItems = frmDataArray.selections;
			var itemTxts = frmDataArray.itemTxt;
			for(var i=0;i<selectedItems.length;i++) {
				var selectionIndex = selectedItems[i];
				var selectedItemName = itemTxts[selectionIndex];
				//_gaq.push(['_trackEvent', '${currentPage.title }', 'SuggestedListAddToList', selectedItemName]);
			}
		}
		
		$.ajax({
			  type: 'POST',
			  cache: false,
			  url: '/services/shoppinglist.activelist.json',
			  data: $('#frm-shopping-list').serialize(),
			  success: function(data){
				  refreshShoppingListWidget(data,false);
				  window.location.href = '${suggestedListManager.currentListPath}.html';
			  },
			  error: function(jqXHR, textStatus, errorThrown) {
		  		  alert("An error has occurred while trying to add this item to your shopping list, Please try again.");	
			  },
			  dataType: 'json'
		});
		
	});
});
</script>