<% 
%><%@ include file="/apps/svubanners/global.jsp" %><% 
%><%@ page session="false" import="com.svu.bannersites.cq5.components.seo.Sitemap" %><% 
%><% 
		Sitemap sitemap = new Sitemap(pageContext);
		pageContext.setAttribute("sitemap",sitemap);
		
		slingResponse.setContentType("text/xml");
%>${sitemap.xml }
