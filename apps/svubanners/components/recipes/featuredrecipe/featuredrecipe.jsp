<%--

  Featured Recipe component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.FeaturedRecipe"%><%
    FeaturedRecipe featuredRecipe = new FeaturedRecipe(pageContext);
    pageContext.setAttribute("featuredRecipe",featuredRecipe);
%>

<c:set var="featureImage" value="${featuredRecipe.imageOverlay}" />

<div>
    <div id="featured-recipe-container" style="background: ${featuredRecipe.backgroundColor};">
        <c:if test="${not empty featureImage}">
            <img src="${featureImage}" class="featured-ribbon" />
        </c:if>
        <div class="left">
            <h4>
                <span>${featuredRecipe.title}</span>
            </h4>
        </div>
        <div class="right">
            <%featuredRecipe.getRecipeImage().draw(out); %>
        </div>
        <p>${featuredRecipe.recipeText}</p>
        <c:if test="${not empty featuredRecipe.articles}">
        <p>${featuredRecipe.articles}</p>
        </c:if>
        <cq:include path="ctaPar" resourceType="foundation/components/parsys" />
    </div>
</div>