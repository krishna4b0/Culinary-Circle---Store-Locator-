<%--

  Recipe Teaser ALT component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.RecipeTeaser"%><%
    RecipeTeaser recipeTeaser = new RecipeTeaser(pageContext);
    pageContext.setAttribute("recipeTeaser", recipeTeaser);
%>
<div class="teaser-alt">
    <h3>${recipeTeaser.recipe.name}</h3>
	<c:choose>
		<c:when test="${empty recipeTeaser.image.data }">
			<img src="${recipeTeaser.imagePath}">
		</c:when>
		<c:otherwise>
			<%recipeTeaser.getImage().draw(out); %>
		</c:otherwise>
	</c:choose>

	<c:choose>
            <c:when test="${not empty recipeTeaser.overrideText}">
            ${recipeTeaser.overrideText }
            </c:when>
            <c:when test="${not empty recipeTeaser.recipe.instructions}">
            ${recipeTeaser.recipe.instructions[0].instruction}...
            </c:when>
        </c:choose>
     <a class="button" href="${recipeTeaser.viewRecipePath}.${recipeTeaser.recipe.recipeId}<c:if test="${not empty recipeTeaser.brand}">.${recipeTeaser.brand}</c:if>.html" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'recipeTeaserAlt', 'Get Recipe-${recipeTeaser.recipe.recipeId}']);">Get Recipe</a>
</div>