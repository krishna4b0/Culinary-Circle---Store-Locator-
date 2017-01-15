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

  Contextual Navigation component

--%><%@ page import="com.svu.bannersites.cq5.components.navigation.ContextualNavigation"%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
	try {
		ContextualNavigation contextNav = new ContextualNavigation(pageContext);
		pageContext.setAttribute("contextNav", contextNav);
%>
<c:choose>
	<c:when test="${empty contextNav.pages  && contextNav.authorMode}">
		<cq:include script="empty.jsp"/>
	</c:when>
	<c:otherwise>
    <div class="sidebar-buttons-container">        
		<ul role="navigation">
			<c:forEach var="navItem" items="${contextNav.pages}">

                <li><a href="${navItem.linkPath }" class='<c:if test="${navItem.selected }">active</c:if>' target="_parent">${navItem.navigationTitle}</a></li>

			</c:forEach>
		</ul>
    </div>
	</c:otherwise>
</c:choose>
<%
	} catch (Exception e){
	    log.error("An Exception occurred while rendering the contextual nav.",e);
		%>An error has occurred while rendering the contextual navigation.  Most likely, this is because the current page is not a child of a Site Configuration Page.<%
	}
%>