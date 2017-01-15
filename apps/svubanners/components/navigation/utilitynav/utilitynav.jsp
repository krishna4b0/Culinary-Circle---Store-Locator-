<%--

  Utility Navigation component.

  Utility Navigation

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.UtilityNavigation"%><%
	UtilityNavigation utilitynavigation = new UtilityNavigation(pageContext);
	pageContext.setAttribute("utilitynavigation", utilitynavigation);
%>

	<c:choose>
		<c:when test="${utilitynavigation.bannerID != 9}">
		  <div id="cust-preferences-top"></div>
			<div id="customer_preferences">
				<form id="frm-email" role="form" method="get" action="${utilitynavigation.emailFormAction }">
					<label 
						for="email">E-mail
					</label>
						<input id="email" title="E-mail" placeholder="Enter email address" name="email">
						<input type="hidden" name="aid" value="${utilitynavigation.emailFormAid }" >
						<input type="hidden" name="n" value="1" >
						<input type="hidden" name="a" value="0" >
					<button type="submit" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'utilitynav', 'Submit']);">Submit</button> 
				</form>
		</c:when>
		<c:otherwise>
			<div id="customer_preferences" class="background-hidden">
				<div class="background">
					<div class="emptySpace"></div>
				</div>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${utilitynavigation.noResource }">
			<c:if test="${utilitynavigation.authorMode }">
				<span>could not resolve ${resource.path}.iframe.html (open the component dialog and save it to fix this error.)</span>
			</c:if>
		</c:when>
		<c:otherwise>
			<noscript>
				<%--if the user has js disabled, load the user info part with an iframe --%>
				<iframe id="iframe-noscript-nav" title="navigation" src="${utilitynavigation.mappedResourcePath}.iframe.html?_ck=nocache" style="width: 401px; float: right; padding: 0;">
					<%-- 
						Neither js or iFrame supported.
						TODO figure out what content should go here in this case
					--%>
				</iframe>
			</noscript>
		</c:otherwise>
	</c:choose>
	<div id="userInfoReplace" ></div>
	<div class="hideImage">
	<cq:include path="headerImage" resourceType="foundation/components/image" />
    </div>
	<cq:include path="logo" resourceType="svubanners/components/navigation/logo" />
</div>
<c:if test="${not utilitynavigation.noResource }">
<script type="text/javascript">
	SVUMaster.frmEmailSubmit = true;
	SVUMaster.mappedResourcePath = '${utilitynavigation.mappedResourcePath}.userinfo.';
</script>
</c:if>
