<%--
 
  Coupon Search Form Component.
 
--%>
    <%
%>
        <%@include file="/apps/svubanners/global.jsp"%>
            <%
%>
                <%@page session="false" import="com.svu.bannersites.cq5.components.savings.CouponSearchForm"%>
                    <%
    CouponSearchForm couponSearchForm = new CouponSearchForm(pageContext);
    pageContext.setAttribute("couponSearchForm", couponSearchForm);
%>
                        <c:choose>
                            <c:when test="${couponSearchForm.cookieValue != null || couponSearchForm.storeId != null || cookie.localStoreCookie.value != null}">
                                <form class="search-coupons-container" method="get" action="${couponSearchForm.resultsPath}.html">
                                    <div class="search-coupons row">
                                        <div class="small-12 medium-4 columns">
                                            <label class="search-coupons-label" for="inp-coupon-search">Search Coupons</label>
                                        </div>
                                        <div class="small-12 medium-6 columns">
                                            <input type="text" aria-required="true" name="keyword" id="inp-coupon-search" title="Search" value="${fn:escapeXml(couponSearchForm.keyword) }" onfocus="if (this.value==this.defaultValue) this.value=''; else this.select()">
 
                                            <input type="submit" id="searchCoupon" class="button" title="Search" value="">
                                        </div>
 
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <h2 class="ss-set-store-required">You'll need to <a href="#" class="ss-select-store-modal">set your store</a> before you can view our coupons.</h2>
                            </c:otherwise>
                        </c:choose>