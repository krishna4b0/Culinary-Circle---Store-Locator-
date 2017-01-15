<%--

	Browse Recipe By Category Header
	
	rendering script for browse recipe by category header component

 --%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.BrowseByCategoryHeader"%><%
	BrowseByCategoryHeader browseRecipeHeader = new BrowseByCategoryHeader(pageContext);
	pageContext.setAttribute("browseRecipeHeader",browseRecipeHeader);
%>
<div id="my-recipe-main-ingredient" class="container tabbed">
	<div class="container-top">&nbsp;</div>
	<h1><span>${browseRecipeHeader.category }</span></h1>
	<div class="container-inner clearfix">
		<ul class="main-ingredient-list clearfix">
			<c:forEach var="subCat" items="${browseRecipeHeader.subCategories }">
			<li><a href="${subCat.value }">${subCat.key }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>