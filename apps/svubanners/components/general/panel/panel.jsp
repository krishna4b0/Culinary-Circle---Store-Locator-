<%--

  Panel Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.Panel"%><%
	Panel panel = new Panel(pageContext);
	pageContext.setAttribute("panel",panel);
%>
<cq:include path="panelpar" resourceType="foundation/components/parsys" />
