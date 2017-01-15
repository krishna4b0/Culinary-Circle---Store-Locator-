<%--

  Seasonal Recipe Teaser component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.SeasonalRecipeTeaser"%><%
	SeasonalRecipeTeaser recipeTeaser = new SeasonalRecipeTeaser(pageContext);
    pageContext.setAttribute("recipeTeaser", recipeTeaser);
%>
<div class="clear-bar">&nbsp;</div>
<div class="recipe-box">
	<p class="tiles"></p>
	<div class="recipe-image">
		<img src="${recipeTeaser.imagePath}" alt="${recipeTeaser.recipe.name}">
	</div>
	<div class="recipe-title">
		<a href="${recipeTeaser.viewRecipePath}.${recipeTeaser.recipe.recipeId}.html">${recipeTeaser.recipe.name}</a>
	</div>
	<div class="recipe-stats">
			<span style=" font-weight: bold;">Ready in:</span>
			<span>${recipeTeaser.recipe.totalTime} minutes</span>
	</div>
	<div class="recipe-summary"></div>
	<p></p>
	<p class="description">
		<a title="Get Recipe" href="${recipeTeaser.viewRecipePath}.${recipeTeaser.recipe.recipeId}.html">GET RECIPE &gt;</a>
	</p>
</div>
<c:if test="${recipeTeaser.authorMode }">
<div class="clearfix">&nbsp;</div>
</c:if>