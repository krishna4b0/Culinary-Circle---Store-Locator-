<%--

  Recipe Carousel component.

  The recipe carousel is used to include several recipes.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.RecipeCarousel"%><%
	RecipeCarousel recipeCarousel = new RecipeCarousel(pageContext);
	pageContext.setAttribute("recipeCarousel", recipeCarousel);
%>

<c:choose>
    <c:when test="${empty recipeCarousel.recipes && recipeCarousel.authorMode}">
        <cq:include script="empty.jsp" />
    </c:when>
    <c:otherwise>
    <div class="${recipeCarousel.wrapperClass }-outer ${recipeCarousel.backgroundCssId }">
        <h5>${recipeCarousel.title }</h5>
        <form method="post" action="${recipeCarousel.formAction }">
        <!-- We need the input below to be set in the dialog -->
        <input value="${recipeCarousel.showPanels }" type="hidden" name="horiz-carousel-panels-visible" id="horiz-carousel-panels-visible"/>
        <input value="${recipeCarousel.showPanels }" type="hidden" name="vert-carousel-panels-visible" id="vert-carousel-panels-visible"/>
        <div class="${recipeCarousel.wrapperClass }-prev disabled">&nbsp;</div>
        <div class="${recipeCarousel.wrapperClass }">
            <ul class="carousel">
            <c:forEach var="slide" items="${recipeCarousel.slides}">
            <li>        
              <a title="${slide.title }" href="${slide.path }" <c:if test="${not empty slide.alt }">alt="${slide.alt }" class="carousel-tool-tip"</c:if>>
				<img width="${recipeCarousel.imageWidth }" height="${recipeCarousel.imageHeight }" src="${slide.imagePath }" alt="${slide.title }" />   
              </a>
            </li>
            </c:forEach>
            </ul>
        </div>
        <div class="carousel-${recipeCarousel.showPanels }slides ${recipeCarousel.wrapperClass }-next">&nbsp;</div>
        </form>
    </div>
    </c:otherwise>
</c:choose>
<div id="help-tool-tip" class="carousel">
	<div id="help-tool-tip-content" class="drop-shadow">This is a tool tip</div>
</div>
