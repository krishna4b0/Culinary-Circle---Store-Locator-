<%--

  Image component.

  Display an image

--%><%@ page import="com.day.cq.commons.Doctype,
com.day.cq.wcm.api.components.DropTarget,com.day.cq.wcm.foundation.Image" %><%
%><%@ page import="com.svu.bannersites.cq5.components.general.ImageComponent" session="false" %>
<%@include file="/apps/svubanners/global.jsp"%><%
ImageComponent imageComp = new ImageComponent(pageContext);
pageContext.setAttribute("imageComp",imageComp);
%>
<c:if test="${imageComp.shouldRender }">
    <%  
    Image image = new Image(resource);

    //drop target css class = dd prefix + name of the drop target in the edit config
    image.addCssClass(DropTarget.CSS_CLASS_PREFIX + "image");
    image.loadStyleData(currentStyle);
    image.setSelector(".img"); // use image script
    image.setDoctype(Doctype.fromRequest(request));
    // add design information if not default (i.e. for reference paras)
    if (!currentDesign.equals(resourceDesign)) {
        image.setSuffix(currentDesign.getId());
    }
    String divId = "cq-image-ng-" + resource.getPath();
    pageContext.setAttribute("divId",divId);
    pageContext.setAttribute("image",image);
    %>

     <div id="<%= divId %>" <c:if test="${imageComp.center}">class="centered"</c:if>><% image.draw(out); %></div><%
    %><cq:text property="jcr:description" placeholder="" tagName="small" escapeXml="true"/>

	<%@ include file="/apps/svubanners/components/general/image/tracking-js.jsp" %>


</c:if>
