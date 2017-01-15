<%--

  Popular Recipes component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.PopularRecipes"%><%
	PopularRecipes popularRecipes = new PopularRecipes(pageContext);
	pageContext.setAttribute("popularRecipes",popularRecipes);
%>

<div id="popular-recipes" class="widget-feature-inner">
	<h3>Popular Recipes</h3>
	<c:choose>
		<c:when test="${empty popularRecipes.recipes && popularRecipes.authorMode}">
			No recipes found.
		</c:when>
		<c:otherwise>			
			<ol>
				<c:forEach var="recipe" items="${popularRecipes.recipes}" varStatus="status">
					<c:choose>
						<c:when test="${status.count%2==0}">
							<li class="even">
						</c:when>
						<c:otherwise>
							<li class="odd">
						</c:otherwise>
					</c:choose>
					
						<a href="${popularRecipes.viewRecipePath}.${recipe.recipeId}.html">${recipe.name}</a>
					</li>
				</c:forEach>
			</ol>
		</c:otherwise>
	</c:choose>
</div>
