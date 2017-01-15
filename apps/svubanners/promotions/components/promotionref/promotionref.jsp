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

--%><%@include file="/apps/svubanners/global.jsp"%><%!
%><%@page session="false" import="com.day.cq.i18n.I18n,
								  java.util.ResourceBundle,
								  com.svu.bannersites.cq5.components.promotions.PromotionReference,
								  com.day.cq.wcm.api.WCMMode"
%>
<%

final ResourceBundle resourceBundle = slingRequest.getResourceBundle(null);
I18n i18n = new I18n(resourceBundle);

PromotionReference promo = new PromotionReference(pageContext);
pageContext.setAttribute("promo",promo);
%>
<c:choose>
	<c:when test="${empty promo.promoPathsToInclude && promo.authorMode }">
		<style type="text/css">
            .cq-teaser-placeholder-off {
                display: none;
            }
        </style>
        <h3 class="cq-texthint-placeholder"><%=i18n.get("Promotion path does not reference a promotion") %></h3>
        <img src="/libs/cq/ui/resources/0.gif" class="cq-teaser-placeholder" alt="">
	</c:when>
	<c:otherwise>
		<c:forEach var="promotionPage" items="${promo.promoPathsToInclude }">
		<%
			WCMMode oldMode = WCMMode.fromRequest(request);
        	WCMMode.DISABLED.toRequest(request);
        %><sling:include replaceSelectors="noscript" path="${promotionPage }" />
        <%
        	oldMode.toRequest(request);
        %>
		</c:forEach>
	</c:otherwise>
</c:choose>


