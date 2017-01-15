<%--

  Recipe Search Form Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.RecipeSearchForm"%><%
	RecipeSearchForm recipeSearchForm = new RecipeSearchForm(pageContext);
	pageContext.setAttribute("recipeSearchForm", recipeSearchForm);
%>
<div class="recipesearchform" style="background: ${recipeSearchForm.backgroundColor };">
	<form method="get" action="${recipeSearchForm.action}">
		<div id="frm-recipe-search-search-n-filter">
			<fieldset>
                <legend class="visually-hidden">Search Recipes</legend>
                <label  for="inp-recipe-search">search recipes</label>
				<input id="inp-recipe-search" type="text" value="${fn:escapeXml(recipeSearchForm.keyword) }" title="Search" name="keyword" />
				<input class="button" type="submit" value="" />
			</fieldset>
		</div>

		
	</form>
</div>