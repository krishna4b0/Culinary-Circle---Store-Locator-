<%--
  Copyright 1997-2010 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Default extended styles script.

  Includes all css style sheets that are specific to a given template.

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false" %>
<c:set var="masterDesignSelected" value="${currentDesign.path==masterDesignPath }" />
<link rel="stylesheet" type="text/css" media="screen" href="<%=masterDesignPath %>/css/twocolumnwideright.css">
<c:if test="${not masterDesignSelected }">
<link rel="stylesheet" type="text/css" media="screen" href="<%=currentDesign.getPath() %>/css/twocolumnwideright.css">
</c:if>