<%--
  ************************************************************************
  ADOBE CONFIDENTIAL
  ___________________

  Copyright 2011 Adobe Systems Incorporated
  All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
  ************************************************************************

--%><%@ page import="com.day.cq.wcm.api.WCMMode,
                 com.day.cq.widget.HtmlLibraryManager,
                 com.day.cq.commons.Doctype, 
                 com.day.cq.i18n.I18n,org.apache.commons.lang3.StringEscapeUtils"
                 
%><%@include file="/apps/svubanners/global.jsp"%><%
    String icnCls = "cq-teaser-header-on";
    if(!currentPage.isValid()) {
        icnCls = "cq-teaser-header-off";
    }
    //TODO completely review this concept: cq-ui and application css are loaded!
%><%
    I18n i18n = new I18n(slingRequest);  
%>
<body class="cq-ui-body">
<div id="cq-ui-header"><a href="javascript:window.top.location='/welcome';" class="home"></a></div>
<h2 class="cq-ui-h2 cq-teaser-status <%= icnCls %>"><%=StringEscapeUtils.escapeHtml4(i18n.getVar(currentPage.getTitle()))%></h2>
<p class="cq-ui-p"><%=i18n.get("The content of the components added to the paragraph system below can be included via the reference or teaser component") %></p>
<div class="cq-ui-edit-box">
    <cq:include script="content.jsp" />
</div>
</body>
