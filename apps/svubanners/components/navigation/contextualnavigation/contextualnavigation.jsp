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
	<div role="navigation">
		<ul id="nav-secondary" class="navigation">
			<c:forEach var="navItem" items="${contextNav.pages}">
				<c:choose>
					<c:when test="${navItem.selected }">
						<li class="subopen">
							<a href="${navItem.linkPath }" target="_parent">${navItem.navigationTitle}</a>
							<c:if test="${not empty navItem.children }">
                                <c:forEach var="navChild" items="${navItem.children}">
                                <c:if test="${navChild.navigationTitle != 'Details'}">
							<ul>
								<c:forEach var="navChild" items="${navItem.children}">
									<c:if test="${navChild.external }">
									<c:set var="linkTarget" value="_blank" />
									</c:if>
									<c:if test="${!navChild.external }">
									<c:set var="linkTarget" value="_parent" />
									</c:if>
									<c:choose>
										<c:when test="${navChild.selected }">
                                        <li><a href="${navChild.linkPath }" target="${linkTarget }" class="active">${navChild.navigationTitle}</a></li>
										</c:when>
										<c:otherwise>
										<li><a href="${navChild.linkPath }" target="${linkTarget }">${navChild.navigationTitle}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
								</c:if>
                                </c:forEach>
                            </c:if>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="${navItem.linkPath }" target="_parent">${navItem.navigationTitle}</a></li>
					</c:otherwise>
				</c:choose>
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