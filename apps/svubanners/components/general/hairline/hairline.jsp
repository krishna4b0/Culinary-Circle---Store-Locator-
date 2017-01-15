<%--

  Hairline component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.Hairline"%><%
	Hairline hairline = new Hairline(pageContext);
	pageContext.setAttribute("hairline",hairline);
%>

<hr>