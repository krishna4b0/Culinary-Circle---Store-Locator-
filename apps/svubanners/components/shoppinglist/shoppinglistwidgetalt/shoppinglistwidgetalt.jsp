<%--

  Shopping List Widget component.

  The shopping list widget appears in the page sidebar and allows a user to view and edit their shopping lists

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.ShoppingListWidget"%><%
	ShoppingListWidget shoppingListWidget = new ShoppingListWidget(pageContext);
	pageContext.setAttribute("shoppingListWidget", shoppingListWidget);
%>
<c:if test="${shoppingListWidget.authorMode && suppressShoppingList }">
    <p class="title main">Shopping List is disabled for this site</p>
</c:if>
<c:if test="${not suppressShoppingList }">
	<div class="widget-feature" id="my-shopping-list">
		<p class="title main">My Shopping List</p>
		<div class="widget-feature-inner">
			<div class="clearfix">
				<p class="title" id="my-shopping-list-name">My Shopping List</p>
				<div id="coupons-count" class="clearfix"><span class="num">0</span> <span class="label">Items</span></div>
			</div><br>
			<div id="shopping-list-container" aria-live="polite">
				<table id="shopping-list-sidebar-items" class="items" cellpadding="0" cellspacing="0">
					<tbody></tbody>
				</table>
			</div><br>
			<a href="${shoppingListWidget.viewListsPage }.html">View My Shopping List</a>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
				url: '/services/shoppinglist.activelist.json',
				cache: false,
				dataType: 'json',
				success: refreshShoppingListWidgetAlt,
				error: function(jqXHR, textStatus, errorThrown) {
			  		 // alert("Sorry, An error has occurred while initializing your shopping list, Please try again.");	
				}
		});
	});
	</script>
</c:if>