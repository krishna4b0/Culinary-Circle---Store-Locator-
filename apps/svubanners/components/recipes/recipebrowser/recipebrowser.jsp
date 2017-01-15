<%--

  recipebrowser component.

  This component displays a list of recipe categories and sub-categories

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.RecipeBrowser"%><%
	RecipeBrowser recipeBrowser = new RecipeBrowser(pageContext);
	pageContext.setAttribute("recipeBrowser", recipeBrowser);
%>
<div class="clearfix" id="recipe-browse-by">
	<h3>Browse Recipes</h3>
	<c:if test="${not empty recipeBrowser.categories}" >
		<c:forEach var="category" items="${recipeBrowser.categories}">
			<div class="recipe-browse-col">
				<h4>${category.categoryName }</h4>
				<ul>
					<c:if test="${not empty category.subcategories }" >
						<c:forEach var="subcategory" items="${category.subcategories }" >
							<li><a href="${recipeBrowser.resultPath }.html?category=${category.categoryName }&subCategoryId=${subcategory.subCategoryId }">${subcategory.subCategoryName }</a></li>
						</c:forEach>
					</c:if>		
				</ul>
			</div>
		</c:forEach>
	</c:if>
</div>
