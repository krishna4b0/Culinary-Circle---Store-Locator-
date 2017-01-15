<%--

  Saved List Widget component.
  A side bar widget that displays the users 5 most recent shopping lists, with links to view them
  

--%><%
%><%@include file="/apps/svubanners/global.jsp"%>
<%@ page import="com.svu.bannersites.cq5.components.shoppinglist.SavedListWidget" %><%
	 SavedListWidget savedlistwidget = new SavedListWidget(pageContext);
	 pageContext.setAttribute("savedlistwidget", savedlistwidget);
	
%>

<div class="widget-feature">
	<h3>Saved Lists</h3>
	<div class="widget-feature-inner">
		<c:choose>
			<c:when test="${empty savedlistwidget.shoppingList}">
				<p>No saved lists</p>
			</c:when>
			<c:otherwise>
				<div class="clearfix">
					<ul class="shoppinglists">
						<c:forEach	var ="list" items="${savedlistwidget.shoppingList}" begin="0" end="4">
							<li class="">
								<p>
									<span class="date"><fmt:formatDate value="${list.createDate}" pattern="MM/dd/yyyy" /></span>
									<br>
									<a href="${savedlistwidget.shoppinglistpath}.html?listId=${list.id}">${list.name}</a>
								</p>
								<a class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'savedlistwidget', 'View']);"href="${savedlistwidget.shoppinglistpath}.html?listId=${list.id}">View</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<p class="view-all">
					<a class="button-link" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'savedlistwidget', 'New List']);" href="${savedlistwidget.shoppinglistpath}.html?newList=true">New List</a>
					<a class="button-link" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'savedlistwidget', 'View All']);" href="${savedlistwidget.viewAllListsPath}.html">View All</a>
				</p>
			</c:otherwise>
		</c:choose>
	</div>
</div>