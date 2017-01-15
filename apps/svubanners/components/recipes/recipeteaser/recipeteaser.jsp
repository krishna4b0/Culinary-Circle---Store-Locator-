<%--

  Recipe Teaser component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.RecipeTeaser"%><%
    RecipeTeaser recipeTeaser = new RecipeTeaser(pageContext);
    pageContext.setAttribute("recipeTeaser", recipeTeaser);
%>
<c:set var="teaserSelectorValue" value="small" />
<c:choose>
    <c:when test="${recipeTeaser.teaserSelector == teaserSelectorValue}">
        <div class="teaser-small">
            <ul class="feature">
                <li class="first">
                    <div class="recipe-image">
                        <c:choose>
                            <c:when test="${empty recipeTeaser.image.data }">
                                <a href="${recipeTeaser.viewRecipePath}.${recipeTeaser.recipe.recipeId}<c:if test="${not empty recipeTeaser.brand}">.${recipeTeaser.brand}</c:if>.html">
                                    <img src="${recipeTeaser.imagePath}" alt="View ${recipeTeaser.recipe.name}">
                                </a>
                            </c:when>
                            <c:otherwise>
                                <%recipeTeaser.getImage().draw(out); %>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="recipe-info">
                    <a href="${recipeTeaser.viewRecipePath}.${recipeTeaser.recipe.recipeId}<c:if test="${not empty recipeTeaser.brand}">.${recipeTeaser.brand}</c:if>.html">                   
                        <h3 style="color:${recipeTeaser.recipeTitleColor}">${recipeTeaser.recipe.name}</h3>
                   
                    <p></p>
                    <p>READY IN : ${recipeTeaser.recipe.totalTime}</p>
                    <p></p>
                     </a>
                    </div>
                </li>                
            </ul>
        </div>
    </c:when>
    <c:otherwise>
        <div class="teaser-large">
        <c:choose>
            <c:when test="${not empty recipeTeaser.linkURL}">
                <a href="${recipeTeaser.linkURL}"><img alt="${recipeTeaser.altText}" src="${recipeTeaser.imagePath}" height="${recipeTeaser.sizeHeight}" width="${recipeTeaser.sizeWidth}"></a>
            </c:when>
            <c:otherwise>
                <img alt="${recipeTeaser.altText}" src="${recipeTeaser.imagePath}" height="${recipeTeaser.sizeHeight}" width="${recipeTeaser.sizeWidth}">
            </c:otherwise>
        </c:choose>
            <div> 
                <a href="${recipeTeaser.viewRecipePath}.${recipeTeaser.recipe.recipeId}<c:if test="${not empty recipeTeaser.brand}">.${recipeTeaser.brand}</c:if>.html">   
                <h3 style="color:${recipeTeaser.recipeTitleColor}">${recipeTeaser.recipe.name}</h3>
            
                <c:choose>
                    <c:when test="${not empty recipeTeaser.overrideText}">
                    ${recipeTeaser.overrideText }
                    </c:when>
                    <c:when test="${not empty recipeTeaser.recipe.instructions}">
                    ${recipeTeaser.recipe.instructions[0].instruction}...
                    </c:when>
                </c:choose>
                </a>
                <a onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-large', 'recipeteaser', 'Get Recipe']);" href="${recipeTeaser.viewRecipePath}.${recipeTeaser.recipe.recipeId}<c:if test="${not empty recipeTeaser.brand}">.${recipeTeaser.brand}</c:if>.html"> Get Recipe ></a>
            </div>
        </div>
    </c:otherwise>
</c:choose>