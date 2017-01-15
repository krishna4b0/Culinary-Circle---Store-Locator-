<%--

 	Extern Link Notification

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.ExternalLink"%><%
	ExternalLink externallink = new ExternalLink(pageContext);
	pageContext.setAttribute("externallink",externallink);
%>
<c:if test="${empty externallink.selectedId || (externallink.id == externallink.selectedId)}">
	<p>
		<a id="intercept-accept" target="_blank" href="${externallink.link }" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'externallink', '${externallink.link }']);">I Agree</a>
	</p>
	<p>
		<a id="intercept-cancel" href="${externallink.back }" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'externallink-back', '${externallink.link }']);">Cancel and return to the previous page</a>
		<!-- back link will go to: ${externallink.back } -->
	</p>
</c:if>