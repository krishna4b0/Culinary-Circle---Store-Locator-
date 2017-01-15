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

  Smart Slideshow component

--%>

<%@ page import="com.day.cq.commons.Doctype,
    com.day.cq.wcm.api.WCMMode,
    com.day.cq.wcm.api.components.DropTarget,
    com.day.cq.wcm.foundation.Image" %>

<%@ page import="com.svu.bannersites.cq5.components.general.Carousel"%><%
%><%@include file="/apps/svubanners/global.jsp"%><%

    Carousel carousel = new Carousel(pageContext);
    pageContext.setAttribute("carousel", carousel);
%>


<c:choose>
  <c:when test="${carousel.authorMode}">
    <div style="background: #ccc; border: 1px solid #373737; height: ${carousel.imageHeight}px; width: ${carousel.imageWidth}px;">
      <h2 style="color: #373737;">Smart Slideshow Component</h2>
      <c:if test="${not empty ctaBlurb.image}">
      <p>${smartslideshow.titleLink}"</p>
      </c:if>
    </div>
  </c:when>
  <c:otherwise>
    <div class="svu-slideshow ${carousel.backgroundCssId}<c:if test='${carousel.verticalLayout}'> superimpose</c:if>">

      <%
        Image image1 = new Image(resource, "image1");
        if (image1.hasContent() || WCMMode.fromRequest(request) == WCMMode.EDIT) {
            image1.loadStyleData(currentStyle);
          // add design information if not default (i.e. for reference paras)
          if (!currentDesign.equals(resourceDesign)) {
            image1.setSuffix(currentDesign.getId());
          }
          //drop target css class = dd prefix + name of the drop target in the edit config
          image1.addCssClass(DropTarget.CSS_CLASS_PREFIX + "image");
          image1.setSelector(".img");
          image1.setDoctype(Doctype.fromRequest(request));
          image1.addAttribute("data-min-width-1024","somevalue_goeshere");
          image1.draw(out);
        }
      %>

      <%
        Image image2 = new Image(resource, "image2");
        if (image2.hasContent() || WCMMode.fromRequest(request) == WCMMode.EDIT) {
            image2.loadStyleData(currentStyle);
          // add design information if not default (i.e. for reference paras)
          if (!currentDesign.equals(resourceDesign)) {
            image2.setSuffix(currentDesign.getId());
          }
          //drop target css class = dd prefix + name of the drop target in the edit config
          image2.addCssClass(DropTarget.CSS_CLASS_PREFIX + "image");
          image2.setSelector(".img");
          image2.setDoctype(Doctype.fromRequest(request));
          image2.addAttribute("data-min-width-1024","somevalue_goeshere");
          image2.draw(out);
        }
      %>

      <%
        Image image3 = new Image(resource, "image3");
        if (image3.hasContent() || WCMMode.fromRequest(request) == WCMMode.EDIT) {
            image3.loadStyleData(currentStyle);
          // add design information if not default (i.e. for reference paras)
          if (!currentDesign.equals(resourceDesign)) {
            image3.setSuffix(currentDesign.getId());
          }
          //drop target css class = dd prefix + name of the drop target in the edit config
          image3.addCssClass(DropTarget.CSS_CLASS_PREFIX + "image");
          image3.setSelector(".img");
          image3.setDoctype(Doctype.fromRequest(request));
          image3.addAttribute("data-min-width-1024","somevalue_goeshere");
          image3.draw(out);
        }
      %>

      <%
        Image image4 = new Image(resource, "image4");
        if (image4.hasContent() || WCMMode.fromRequest(request) == WCMMode.EDIT) {
            image4.loadStyleData(currentStyle);
          // add design information if not default (i.e. for reference paras)
          if (!currentDesign.equals(resourceDesign)) {
            image4.setSuffix(currentDesign.getId());
          }
          //drop target css class = dd prefix + name of the drop target in the edit config
          image4.addCssClass(DropTarget.CSS_CLASS_PREFIX + "image");
          image4.setSelector(".img");
          image4.setDoctype(Doctype.fromRequest(request));
          image4.addAttribute("data-min-width-1024","somevalue_goeshere");
          image4.draw(out);
        }
      %>

      <%
        Image image5 = new Image(resource, "image5");
        if (image5.hasContent() || WCMMode.fromRequest(request) == WCMMode.EDIT) {
            image5.loadStyleData(currentStyle);
          // add design information if not default (i.e. for reference paras)
          if (!currentDesign.equals(resourceDesign)) {
            image5.setSuffix(currentDesign.getId());
          }
          //drop target css class = dd prefix + name of the drop target in the edit config
          image5.addCssClass(DropTarget.CSS_CLASS_PREFIX + "image");
          image5.setSelector(".img");
          image5.setDoctype(Doctype.fromRequest(request));
          image5.addAttribute("data-min-width-1024","somevalue_goeshere");
          image5.draw(out);
        }
      %>

    </div>
  </c:otherwise>
</c:choose>

<script>
  var svuSlideshowWidth = ${carousel.imageWidth};
  var svuSlideshowHeight = ${carousel.imageHeight};
  var svuSlideshowInterval = ${carousel.showPanels} * 1000;
</script>

<style>
  .svu-slideshow .slidesjs-container,
  .slidesjs-container .slidesjs-control {
    height: ${carousel.imageHeight}px !important;
  }
  .svu-slideshow {
    width: ${carousel.imageWidth}px !important;
  }
</style>
