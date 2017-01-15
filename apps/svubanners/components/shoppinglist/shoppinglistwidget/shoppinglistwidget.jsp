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
	<div class="widget-shopping-list hideprint empty">
        <p class="title main">My Shopping List</p>
	  <div class="empty-list-content hide" style="display: block; ">
	    <img src="/etc/designs/svubanners/master/img/hero-shopping-list-widget.jpg" alt="" title="">
	    <p class="title">${shoppingListWidget.emptyHeadline }</p>
	    <div class="widget-button-holder empty-list">
	      <form action="${shoppingListWidget.viewListsPage }.html">
	        <button class="button" type="submit" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistwidget', 'Create a list']);" >Create a List</button>
	      </form>
	    </div>	    
	    <p>${shoppingListWidget.emptyText }</p>
	  </div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url: '/services/shoppinglist.activelist.json',
			cache: false,
			dataType: 'json',
			success: function(data){
				refreshShoppingListWidget(data,true);	
			},
			error: function(jqXHR, textStatus, errorThrown) {
		  		//  alert("Sorry, An error has occurred while initializing your shopping list.");	
			}
		});
	});
	</script>
</c:if>