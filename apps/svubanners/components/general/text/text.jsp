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

  Text component

  Draws text.

--%><%

%><%@ page import="com.svu.bannersites.cq5.components.general.Text" session="false" %>
<%@include file="/apps/svubanners/global.jsp"%><%
Text textComp = new Text(pageContext);
pageContext.setAttribute("textComp",textComp);
%>
<c:if test="${textComp.shouldRender }">
	<cq:text value="${textComp.text }" />
</c:if>