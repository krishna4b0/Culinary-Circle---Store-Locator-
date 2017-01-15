<%--
  Copyright 1997-2009 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Carousel component

--%><%@ page import="com.svu.bannersites.cq5.components.general.Carousel"%><% 
%><%@include file="/apps/svubanners/global.jsp"%><%

    Carousel carousel = new Carousel(pageContext);
    pageContext.setAttribute("carousel", carousel);
%>
<c:choose>
    <c:when test="${empty carousel.slides && carousel.authorMode}">
        <cq:include script="empty.jsp" />
    </c:when>
    <c:otherwise>
    <div class="${carousel.wrapperClass }-outer ${carousel.backgroundCssId }">
    	<c:if test="${not empty carousel.title}">
        	<h5>${carousel.title }</h5>
        </c:if>
        <form method="post" action="${carousel.formAction }">
        <!-- We need the input below to be set in the dialog -->
        <input value="${carousel.showPanels }" type="hidden" name="horiz-carousel-panels-visible" id="horiz-carousel-panels-visible"/>
        <input value="${carousel.showPanels }" type="hidden" name="vert-carousel-panels-visible" id="vert-carousel-panels-visible"/>
        <div class="${carousel.wrapperClass }-prev disabled">&nbsp;</div>
        <div class="${carousel.wrapperClass }">
            <ul class="carousel">
            <c:forEach var="slide" items="${carousel.slides}">

              <c:choose>
                <c:when test="${slide.overlayLabel }">
                  <li>
                </c:when>
                <c:otherwise>
                  <li class="no-label">
                </c:otherwise>
              </c:choose>            

              <c:choose>
                <c:when test="${not empty slide.path}">
                  <a title="${slide.title }" href="${slide.path }" <c:if test="${not empty slide.alt }">alt="${slide.alt }" class="carousel-tool-tip"</c:if>>
                </c:when>
                <c:otherwise>
                  <a title="${slide.title }" href="#" <c:if test="${not empty slide.alt }">alt="${slide.alt }" class="carousel-tool-tip"</c:if>>
                </c:otherwise>
              </c:choose>   

              
              <img width="${carousel.imageWidth }" height="${carousel.imageHeight }" src="${slide.imagePath }" alt="${slide.title }" />   

              </a>
              
              </li>
            </c:forEach>
            </ul>
        </div>
        <div class="carousel-${carousel.showPanels }slides ${carousel.wrapperClass }-next">&nbsp;</div>
        </form>
    </div>
    </c:otherwise>
</c:choose>
<div id="help-tool-tip" class="carousel">
	<div id="help-tool-tip-content" class="drop-shadow">This is a tool tip</div>
</div>