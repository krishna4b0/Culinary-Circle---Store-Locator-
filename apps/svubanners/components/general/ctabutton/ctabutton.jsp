<%--

  CTA Button component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.CTAButton"%><%
	CTAButton ctaButton = new CTAButton(pageContext);
	pageContext.setAttribute("ctaButton",ctaButton);
%>
<a href="${ctaButton.link}" class="${ctaButton.style}"
	<c:if test ="${ctaButton.style == 'button' && ctaButton.color!='default' }">style="background:${ctaButton.color }"</c:if>
	<c:if test="${ctaButton.newWindow }">target="_blank"</c:if> onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'ctabutton', '${ctaButton.label}']);">${ctaButton.label}
</a>


