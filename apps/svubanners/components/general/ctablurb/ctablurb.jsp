<%--

  CTA Blurb component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.CTABlurb"%><%
	CTABlurb ctaBlurb = new CTABlurb(pageContext);
	pageContext.setAttribute("ctaBlurb",ctaBlurb);
%>

<div id="container-top">
	<h3>
		<span>${ctaBlurb.title}</span>
	</h3>
	<div id="container-inner">
		<c:if test="${not empty ctaBlurb.image}">
		<p>
			<% ctaBlurb.getImage().draw(out); %>
		</p>
		</c:if>
		<p>${ctaBlurb.text}</p>
		<cq:include path="ctabutton" resourceType="svubanners/components/general/ctabutton" />
		
	</div>
</div>