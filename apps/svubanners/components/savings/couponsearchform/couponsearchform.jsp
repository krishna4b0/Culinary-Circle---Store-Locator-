<%--
 
  Coupon Search Form Component.
 
--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.CouponSearchForm"%><%
    CouponSearchForm couponSearchForm = new CouponSearchForm(pageContext);
    pageContext.setAttribute("couponSearchForm", couponSearchForm);
%>
<c:choose>
<c:when test="${couponSearchForm.cookieValue != null || couponSearchForm.storeId != null || cookie.localStoreCookie.value != null}">
<form method="get" action="${couponSearchForm.resultsPath}.html">
  <div id="my-coupon-search-n-filter" class="clearfix">
    <div>
      <div id="my-coupon-search-n-filter-wrapper" class="clearfix">
        <div id="frm-coupon-search-search-n-filter">
          <fieldset>
            <legend class="visually-hidden">Search Coupons</legend>
            <label for="inp-coupon-search" >Search Coupons</label>
            <input type="text" aria-required="true" name="keyword" id="inp-coupon-search" title="Search" value="${fn:escapeXml(couponSearchForm.keyword) }" onfocus="if (this.value==this.defaultValue) this.value=''; else this.select()">
            
            <input type="submit" id="searchCoupon" class="button" title="Search" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-keyword', 'couponsearchform', 'Search']);" value="">
            
          </fieldset>
        </div>
      </div>
    </div>
  </div>
</form>
</c:when>
<c:otherwise>
<h2 class="ss-set-store-required">You'll need to <a href="#" class="ss-select-store-modal">set your store</a> before you can view our coupons.</h2>
</c:otherwise>
</c:choose>