<%--
	Supervalu, Inc.
	
	Include the foundation global.jsp in our "implementation" of a global.jsp
	
--%>
<%@page trimDirectiveWhitespaces="true" %>
<%@page session="false" import="com.svu.bannersites.cq5.core.SVUBannerConstants"%>
<%@include file="/libs/foundation/global.jsp"%>
<%
	String masterDesignPath = SVUBannerConstants.MASTER_DESIGN_PATH;
	pageContext.setAttribute("masterDesignPath",masterDesignPath);
%>







