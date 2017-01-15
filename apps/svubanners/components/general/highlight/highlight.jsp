<%--

  Highlight Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.Highlight"%><%
	Highlight highlight = new Highlight(pageContext);
	pageContext.setAttribute("highlight",highlight);
%>
<cq:include path="highlightpar" resourceType="foundation/components/parsys" />
