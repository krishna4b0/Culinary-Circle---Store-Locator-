<%--

  Category Page Header Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.CategoryPageHeader"%><%
	CategoryPageHeader cph = new CategoryPageHeader(pageContext);
	pageContext.setAttribute("cph",cph);
%>
<cq:include path="title" resourceType="svubanners/components/general/title" />
<div id="section-1" class="${cph.imageWidthClass}">
<cq:include path="titleimage" resourceType="foundation/components/image" />
<cq:include path="toppar" resourceType="foundation/components/parsys" />
