<%--

  Utility Navigation component.

  Utility Navigation

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.UtilityNavigation"%><%
    UtilityNavigation utilitynavigation = new UtilityNavigation(pageContext);
    pageContext.setAttribute("utilitynavigation", utilitynavigation);
%>
<div id="customer_preferences" class="hidden">
    <c:choose>
        <c:when test="${utilitynavigation.noResource }">
            <c:if test="${utilitynavigation.authorMode }">
                <span>could not resolve ${resource.path}.iframe.html (open the component dialog and save it to fix this error.)</span>
            </c:if>
        </c:when>
        <c:otherwise>
            <noscript>
                <%--if the user has js disabled, load the user info part with an iframe --%>
                <iframe id="iframe-noscript-nav" src="${utilitynavigation.mappedResourcePath}.iframe.html?_ck=nocache" style="width: 401px; float: right; padding: 0;">
                    <%-- 
                        Neither js or iFrame supported.
                        TODO figure out what content should go here in this case
                    --%>
                </iframe>
            </noscript>
        </c:otherwise>
    </c:choose>
    
    <div class="background">
        <div class="emptySpace"></div>
    </div>
    <div id="userInfoReplace" style="display: none;"></div>
    	<c:set var="headerImage" value="utilityNav/headerImage" />
		<cq:include path="${template.bannerImagePath}${headerImage}" resourceType="foundation/components/image" />
  	    <cq:include path="logo" resourceType="svubanners/components/navigation/logo" />
</div>