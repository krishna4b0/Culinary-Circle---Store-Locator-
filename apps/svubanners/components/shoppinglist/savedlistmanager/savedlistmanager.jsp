<%--

  Saved Shopping List Manager component.

  

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.SavedListManager"%><%
	SavedListManager savedListManager = new SavedListManager(pageContext);
	pageContext.setAttribute("savedListManager", savedListManager);
%>

<div id="saved-list-manager-content" aria-role="main">
	<div class="typical">
		<h1>My Saved Lists</h1>
		<div>		
			<table class="saved-lists" cellspacing="0" cellpadding="0" border="0" summary="My saved shopping lists">
				<tbody>
					<c:if test="${not empty savedListManager.shoppingList}">
						<c:forEach var ="list" items="${savedListManager.shoppingList}">
							<tr class="">
								<td>
									<span class="date"><fmt:formatDate value="${list.modifiedDate}" pattern="yyyy-MM-dd" /></span>
									<h2>${list.name}</h2>
								</td>
								<td class="open">
									<a class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'savedlistmanager', 'Open']);" href="${savedListManager.viewListPath}.html?listId=${list.id}">&nbsp;Open</a>
								</td>
								<td class="delete">
									<a href="${currentPage.path}.html?listId=${list.id}">
										<img alt="Delete list" src="/etc/designs/svubanners/master/images/icn-delete.png">
									</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<a href="${savedListManager.viewListPath}.html">Back to Shopping List</a>
	</div>
</div>
