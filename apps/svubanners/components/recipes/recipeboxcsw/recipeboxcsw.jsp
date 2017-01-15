<%--

  Recipe Box Cross-Sell Widget component.

  This widget is gives the user a quick, visual representation of the current state of their recipe box.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.RecipeBoxCSW"%><%
	RecipeBoxCSW recipeBoxCSW = new RecipeBoxCSW(pageContext);
	pageContext.setAttribute("recipeBoxCSW", recipeBoxCSW);
%>
<div id="my-recipe-panel">
	<label>Last saved:</label>
	<form name="myRecipeBoxForm" method="GET" action="${recipeBoxCSW.recipeBoxPath }.html">
		<c:choose>
			<c:when test="${recipeBoxCSW.username == ''}">
		  		<div class="saved">You have no saved recipes</div>
		  		<input type="submit" value="Sign up" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'recipeBoxCSW', 'Sign UP']);">
		  	</c:when>
			<c:otherwise>
				<div class="saved">${recipeBoxCSW.recipe.name }</div>
		  		<input type="submit" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'recipeBoxCSW', 'View Recipes']);" value="${recipeBoxCSW.recipeBox.totalRecordsFound } Saved Recipes" class="button">
		  	</c:otherwise>
		</c:choose>
	</form>
</div>
<div class="clearfix">&nbsp;</div>