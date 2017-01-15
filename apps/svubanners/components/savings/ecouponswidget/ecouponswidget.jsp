<%--

  My eCoupons Widget component.

  A sidebar widget that displays to the user the number of eCoupons they currently have saved to their rewards card.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.ECouponsWidget"%><%
	ECouponsWidget eCouponsWidget = new ECouponsWidget(pageContext);
	pageContext.setAttribute("eCouponsWidget", eCouponsWidget);
%>
<c:if test="${!eCouponsWidget.anonymous || eCouponsWidget.authorMode }">
	<div>
		<div id="ecoupon-summary-widget" class="widget-feature">
			<h3>
			  My eCoupons
			</h3>
			<div class="widget-feature-inner">
				<div>
					<h4>eCoupons Saved</h4>
					<span data-couponCount="${eCouponsWidget.couponsAvailable }" data-couponRemain="${eCouponsWidget.couponsRemaining}" id="couponsOnCard"> ${eCouponsWidget.couponsAvailable }  (${eCouponsWidget.couponsRemaining} Remaining) </span>
				</div><br>
				<div>
				  <a href="${eCouponsWidget.ecouponsPath }.html" id="eCouponId" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'ecouponswidget', 'View eCoupons saved to card']);">View eCoupons saved to card</a>
				</div>
			</div>
		</div>
	</div>
</c:if>