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

  Default head script.

  Draws the HTML head with some default content:
  - includes the WCML init script
  - includes the head libs script
  - includes the favicons
  - sets the HTML title
  - sets some meta data

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@ page import="com.day.cq.commons.Doctype, org.apache.commons.lang.StringEscapeUtils" session="false" %>
<% String iconPath = currentDesign.getPath(); %>
<head>
	<cq:include script="pagemeta.jsp" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="pagekey" content="${template.siteSection }">
	<meta name="division" content="${template.division }">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
	<cq:include script="styles.jsp"/>
	<script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
	<script>
		window.jQuery || document.write('<script src="/etc/designs/svubanners/master/js/jquery-1.9.1.min.js"><\/script>');
		var SVUMaster = {};
		SVUMaster.banner = "${bannerSpecifier}";
		SVUMaster.siteSection = "${template.siteSection}";
        SVUMaster.breadCrumbPath = "${template.mappedResourcePath}";
        SVUMaster.isSocial = ${isSocial};
        SVUMaster.isLoadToAccount = ${isLoadToAccount};
        SVUMaster.googleTagManagerId = "${googleTagManagerId}";
	</script>
	<cq:include script="headlibs.jsp"/>
	<cq:include script="stats.jsp"/>
	<c:choose>
		<c:when test="${template.authorMode}">
			<cq:include script="init.jsp"/>
		</c:when>
	</c:choose>
	<link rel="shortcut icon" type="image/x-icon" href="<%= iconPath + "/favicon.ico" %>">
	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="<%= iconPath + "/apple-touch-icon-57x57-precomposed.png" %>">
	<link rel="apple-touch-icon-precomposed" sizes="76x76" href="<%= iconPath + "/apple-touch-icon-76x76-precomposed.png" %>">
	<link rel="apple-touch-icon-precomposed" sizes="120x120" href="<%= iconPath + "/apple-touch-icon-120x120-precomposed.png" %>">
	<link rel="apple-touch-icon-precomposed" sizes="152x152" href="<%= iconPath + "/apple-touch-icon-152x152-precomposed.png" %>">
	<cq:include script="gaq.jsp"/>
</head>