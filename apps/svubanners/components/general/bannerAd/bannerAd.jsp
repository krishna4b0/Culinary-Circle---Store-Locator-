<%--

  Banner Ad Component

--%>

<%@ page import="com.svu.bannersites.cq5.components.general.BannerAd" session="false" %>

<%@include file="/apps/svubanners/global.jsp"%><%
	BannerAd bannerAd = new BannerAd(pageContext);
	pageContext.setAttribute("bannerAd",bannerAd);
%>

<c:if test="${bannerAd.authorMode && empty bannerAd.adCode}">
  <div style="background: #ccc; border: 1px solid #373737;">
    <h2 style="color: #373737;">Banner Ad Component</h2>
  </div>
</c:if>

  <script type="text/javascript"><cq:text value="${bannerAd.adCode}" /></script>
  <noscript>${bannerAd.noscript}</noscript>
