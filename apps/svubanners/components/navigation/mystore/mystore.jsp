<%--

  My Store component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.MyStore"%><%
    MyStore myStore = new MyStore(pageContext);
    pageContext.setAttribute("myStore", myStore);
%>
<div id="store-name" class="hideprint">
	    My Store: <a href="${myStore.siteRootPath}/stores/view-store.html">Store Details</a><span> (<a href="${myStore.siteRootPath}/stores/search-stores.html" title="Select another store">change</a>)</span>
	    <c:if test="${not empty myStore.holidayHours}">
	    	<a href="${myStore.siteRootPath}/stores/view-store.html">Holiday Hours</a>	       
	    </c:if>
	 
</div>
