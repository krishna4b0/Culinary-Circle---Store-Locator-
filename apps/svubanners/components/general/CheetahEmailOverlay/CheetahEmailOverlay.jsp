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

  Cheetah EMail Acquisition Overlay Component (CheetahEmailOverlay)

  Displays an overlay (fancybox) that asks the user if s/he would like to sign
  up to receive marketing e-mail.

--%><%

%>

<%@ page import="com.svu.bannersites.cq5.components.general.Text" session="false" %>
<%@include file="/apps/svubanners/global.jsp"%>
<%
  Text textComp = new Text(pageContext);
  pageContext.setAttribute("textComp",textComp);
%>

<c:choose>
  <c:when test="${textComp.authorMode}">
      <div id="HiddenComponentPlaceholder">[CheetahEmailOverlay Component]</div>
  </c:when>
  <c:otherwise>
      <script type="text/javascript" src="/etc/designs/svubanners/master/js/svuMailingListSubscriber.js"></script>
  </c:otherwise>
</c:choose>
