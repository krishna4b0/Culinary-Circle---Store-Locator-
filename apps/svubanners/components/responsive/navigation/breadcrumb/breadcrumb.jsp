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

  Breadcrumb Navigation component

--%><%@ page import="com.svu.bannersites.cq5.components.navigation.Breadcrumb"%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
	try {
		Breadcrumb breadcrumb = new Breadcrumb(pageContext);
		pageContext.setAttribute("breadcrumb", breadcrumb);
%>
<ul id="nav-breadcrumb" class="navigation">
<c:forEach var="crumb" items="${breadcrumb.pages}">
<li><a href="${crumb.linkPath }" target="_parent">${crumb.navigationTitle}</a></li>
</c:forEach>
<li>${breadcrumb.currentPageNavigationTitle}</li>
</ul>
<%
	} catch(Exception e) {
		log.error("An Exception occurred while rendering the breadcrumb.",e);
		%>An error has occurred while rendering the breadcrumb.  Most likely, this is because the current page is not a child of a Site Configuration Page.<%
	}
%>