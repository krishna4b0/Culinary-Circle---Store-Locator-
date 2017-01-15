<%--

    Popular Coupons Widget component
        
--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.PopularCoupons"%><%
PopularCoupons popularCoupons = new PopularCoupons(pageContext);
pageContext.setAttribute("popularCoupons", popularCoupons);
%>
<div class="widget-feature">
<h3>Popular Coupons</h3>
	<div id="popular-coupons" class="widget-feature-inner">		
		<p>This Week</p>
		<ol>
			<c:if test="${not empty popularCoupons.coupons}">
			<c:forEach var="coupon" items="${popularCoupons.coupons}">
			<li>
				<a href="${popularCoupons.viewCouponPath}.html?couponId=${coupon.couponId}">${coupon.displayName}</a>
			</li>
			</c:forEach>
			</c:if>
		</ol>
	</div>
</div>