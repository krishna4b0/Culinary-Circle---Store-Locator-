<%--

  Shopping List Manager component.

  Component to manage shopping lists

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.seo.Sitemap"%><%
	Sitemap siteMap = new Sitemap(pageContext);
	pageContext.setAttribute("siteMap", siteMap);
%>
<div class="typical">
	<ul>
	<%--creating the html in the model class, mostly because its recursive logic and trying to do that in jstl sucks.  maybe consider refactoring this? --%>
	${siteMap.html }
	</ul>
</div>
