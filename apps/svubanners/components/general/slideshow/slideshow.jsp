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

  Slideshow component

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
    <div id="example" class="svu-slideshow<c:if test='${carousel.verticalLayout}'> superimpose</c:if>">

          <c:forEach var="slide" items="${carousel.slides}">

            <c:if test="${not empty slide.path}">
              <a title="${slide.title}" href="${slide.path}" <c:if test="${not empty slide.alt}">alt="${slide.alt}" class="svu-slideshow-tool-tip"</c:if> onclick="//_gaq.push(['_trackEvent', '${currentPage.title}', 'Image Link Click', '${slide.title}']);">
            </c:if>
    
            <img width="${carousel.imageWidth}" height="${carousel.imageHeight}" src="${slide.imagePath}" alt="${slide.title}" />

            <c:if test="${not empty slide.path}">
              </a>
            </c:if>
    
          </c:forEach>

    </div> 
  </c:otherwise>
</c:choose>

<script>
  var svuSlideshowWidth = ${carousel.imageWidth};
  var svuSlideshowHeight = ${carousel.imageHeight};
  var svuSlideshowInterval = ${carousel.showPanels} * 1000;
</script>

<!-- combined css can be used 
<style>
  .svu-slideshow .slidesjs-container,
  .slidesjs-container .slidesjs-control {
    height: ${carousel.imageHeight}px !important;
  }
  .svu-slideshow {
    width: ${carousel.imageWidth}px !important;
  } 
</style>
-->
