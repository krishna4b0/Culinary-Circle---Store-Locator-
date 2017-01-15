<%--

  Homepage Shopping List Widget component.

  The homepage shopping list widget will display items in the customers shopping list in the homepage.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.HomepageShoppingListWidget"%><%
	HomepageShoppingListWidget homepageShoppingListWidget = new HomepageShoppingListWidget(pageContext);
	pageContext.setAttribute("homepageShoppingListWidget", homepageShoppingListWidget);
%>
<div id="homepage-list-widget">
	<div id="empty-list-content">
		<h3>${homepageShoppingListWidget.emptyHeadline }</h3>
		<p>${homepageShoppingListWidget.emptyText }</p>
		<a href="${homepageShoppingListWidget.viewListsPage }.html" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'homepageshoppinglistwidget', 'Create a List']);">Create a List</a>
	</div>
	<div id="list-widget-content">
	</div>
</div>
<div class="image"></div>