<%--

  My eCoupons Component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.ECoupons,java.util.Calendar,java.util.Date"%><%
	ECoupons eCoupons = new ECoupons(pageContext);
	pageContext.setAttribute("eCoupons", eCoupons);
                                                                                                                             
    Calendar dateUtil = Calendar.getInstance();
%>
<form action="${currentPage.path}.html" method="get">
	<div class="container tabbed">
		<div class="container-top">&nbsp; </div>
		<h1>
			<span>My eCoupons</span>
		</h1>
		<div id="coupons-filter">
			<div class="container-inner clearfix">
				<c:if test = "${not empty eCoupons.coupons}">
					<div class="filter-col-1"> Congratulations! These offers have been loaded to your account. They are valid only on your rewards account. </div>
				</c:if>				
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test = "${empty eCoupons.coupons}">
			<div>Sorry, no results found.</div>
		</c:when>
		<c:otherwise>
			<div class="clearfix">
				<a id="print" href="${eCoupons.printCouponsPage }?ecoupons=true&couponStatus=${eCoupons.status}">Print coupon list</a>
				<ul id="coupon-sort-bar">
					<li class="">
						<a href="${currentPage.path}.html?couponStatus=${eCoupons.status}&sortDirection=${eCoupons.newSortDirection}&sortProperty=title">Item</a>
					</li>
					<li class="">
						<a href="${currentPage.path}.html?couponStatus=${eCoupons.status}&sortDirection=${eCoupons.newSortDirection}&sortProperty=endOn">Expiration</a>
					</li>
					<li class="">
						<a href="${currentPage.path}.html?couponStatus=${eCoupons.status}&sortDirection=${eCoupons.newSortDirection}&sortProperty=value">Estimated Value</a>
					</li>
				</ul>
				<div id="ecoupon-list">
					<c:forEach var="coupon" items="${eCoupons.coupons}">
                        <c:set var="endOn" value="${coupon.endOn}"/>
                        <%
                           dateUtil.setTime((Date)pageContext.getAttribute("endOn"));
                           dateUtil.add(Calendar.HOUR, -1);
                           pageContext.setAttribute("endOn", dateUtil.getTime());
                        %>
						<div id="coupons-outer">
							<div class="coupon-outer">
								<div class="coupon-inner">
									<img class="img-left framed" src="${coupon.logoUrl}">
									<div class="clearfix itemlinks">
										<h3>${coupon.displayName}</h3>
										<p>
											<strong>${coupon.savingsValueStatement}</strong> ${coupon.purchaseDescription}
										</p>
										<p>
	                                        <span class="expiration">Valid <fmt:formatDate pattern="MM/dd/yy" value="${coupon.startOn}" />
	                                            - <fmt:formatDate pattern="MM/dd/yy" value="${endOn}" />
											</span>
										</p>
									</div>
								</div>
								<div class="coupon-options ">
									<div class="delete-to-list-container">
										<c:if test="${(eCoupons.status != 'Redeemed') && (eCoupons.status != 'Expired')}">
											<c:choose>
												<c:when test="${coupon.targeted}">
													<a class="delete-to-list" href="/services/ecoupons.html?action=remove&couponId=${coupon.couponId }&targeted=true">Delete From Account</a>
												</c:when>
												<c:otherwise>
													<a class="delete-to-list" href="/services/ecoupons.html?action=remove&couponId=${coupon.couponId }">Delete From Account</a>
												</c:otherwise>
											</c:choose>
											
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</form>