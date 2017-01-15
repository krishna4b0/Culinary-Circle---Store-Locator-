<%--

  Image Blurb component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.ImageBlurb"%><%
	ImageBlurb imageBlurb = new ImageBlurb(pageContext);
	pageContext.setAttribute("imageBlurb",imageBlurb);
%>

<div>
	<p style="float: ${imageBlurb.floatPosition};"><%imageBlurb.getImage().draw(out); %></p>
	<c:if test="${not empty imageBlurb.titleLink}"><a href="${imageBlurb.titleLink }"></c:if>
	<c:if test="${not empty imageBlurb.title}">
		<h2>${imageBlurb.title}</h2>
	</c:if>
	<c:if test="${not empty imageBlurb.titleLink}"></a></c:if>
	${imageBlurb.text}
</div>