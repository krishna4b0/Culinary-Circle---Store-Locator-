<%--

  Banner Logo component.

  

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.Logo"%><%
	Logo logo = new Logo(pageContext);
	pageContext.setAttribute("logo",logo);
%>
<div role="banner" id="logo">
	<a href="${logo.linkPath }"><em>${logo.bannerName }</em></a>
</div>