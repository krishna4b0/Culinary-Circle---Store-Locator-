<%--

  Suggested List Widget component.


--%><%
%><%@include file="/apps/svubanners/global.jsp"%>
<%@ page import="com.svu.bannersites.cq5.components.shoppinglist.SuggestedListWidget"%><%
	SuggestedListWidget suggestedlistwidget = new SuggestedListWidget(pageContext);
	pageContext.setAttribute("suggestedlistwidget", suggestedlistwidget);
%>

<c:choose>
	<c:when test="${empty suggestedlistwidget.pages && suggestedlistwidget.authorMode}">
		<cq:include script="empty.jsp"/>
	</c:when>
	<c:otherwise>
		<div>
			<div id="shopping-list-suggested-lists" class="widget-feature">
				<h3>Suggested Lists</h3>
				<div class="widget-feature-inner">
					<div class="clearfix">
						<ul class="shoppinglists">
							<c:forEach var="pages" items="${suggestedlistwidget.pages}">
								<li class="">
									<p>
										<fmt:formatDate pattern="MM/dd/yyyy" value="${pages.lastModified.time}" />
										<br>
										<a href="${pages.path}.html">${pages.title}</a>
									</p>
									<a class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'suggestedlistwidget', 'View']);" href="${pages.path}.html">View</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<p class="view-all">
						<a href="${suggestedlistwidget.rootPagePath}.html">View All Suggested Lists</a>
					</p>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
