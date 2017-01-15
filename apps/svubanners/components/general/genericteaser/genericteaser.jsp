<%--

  Generic Teaser component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.GenericTeaser"%><%
	GenericTeaser genericTeaser = new GenericTeaser(pageContext);
	pageContext.setAttribute("genericTeaser",genericTeaser);
%>


<div>
	<div class="teaserimage"><% genericTeaser.getImage().draw(out); %></div>
	<h3>${genericTeaser.title}</h3>
	<p>${genericTeaser.text}</p>
	<cq:include path="teaserpar" resourceType="svubanners/components/general/ctabutton" />
</div>