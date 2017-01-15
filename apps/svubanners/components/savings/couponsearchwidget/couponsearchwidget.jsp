<%--

  Coupon Search Widget Component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.CouponSearchWidget"%><%
	CouponSearchWidget couponSearchWidget = new CouponSearchWidget(pageContext);
	pageContext.setAttribute("couponSearchWidget", couponSearchWidget);
%>

<form action="${couponSearchWidget.resultsPath}.html" method="get">
	<div class="widget-feature">
		<h3> Find Coupons </h3>
		<div class="widget-feature-inner">
			Search Specials
			<br>
			<input type="text" name="keyword" value="">
			<button class="button" type="submit" value="Search" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-keyword', 'couponsearchwidget', 'Search']);"> Search </button>
			<br>
			<br>
			Coupons by Category
			<br>
			<select id="category" name="category">
				<option value="">All</option>
				<c:if test="${not empty couponSearchWidget.categories}" >
					<c:forEach var="category" items="${couponSearchWidget.categories}">
						<option value="${category}" title="${category}">${category}</option>
					</c:forEach>
				</c:if>
			</select>
			<button class="button" type="submit" value="Search" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-category', 'couponsearchwidget', 'Search']);"> Search </button>
		</div>
	</div>
</form>