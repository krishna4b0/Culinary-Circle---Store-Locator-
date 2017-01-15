<%--

  Utility Navigation component.

  Utility Navigation

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.UtilityNavigation"%><%
	UtilityNavigation utilitynavigation = new UtilityNavigation(pageContext);
	pageContext.setAttribute("utilitynavigation", utilitynavigation);
%>
<html lang="en">
	<head>
		<title>Navigation</title>
	</head>
	<body>
		<cq:include script="userinfo.jsp" />
	</body>
</html>
    