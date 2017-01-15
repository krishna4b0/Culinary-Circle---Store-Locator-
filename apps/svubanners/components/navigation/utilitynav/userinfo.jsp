<%--

  Utility Navigation component, user info portion

  Utility Navigation

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.UtilityNavigation"%><%
    UtilityNavigation utilitynavigation = new UtilityNavigation(pageContext);
    pageContext.setAttribute("utilitynavigation", utilitynavigation);
%>

<c:choose>
    <c:when test="${utilitynavigation.anonymous == false}">
    <div role="navigation">
        <ul class="loggedin" id="nav-account">
            <li class="logout"><a id="logout-button" href="#" data-resource="${utilitynavigation.forwardPath}">Log Out</a></li>
            <li class="login-relative">&nbsp;
                <ul id="login-options">
                    <li id="login-options-list"><a id="toolsMenu" target="_top" href="#">My Tools</a></li>
                    <div id="login-options-exp" class="clearfix">
                        <ul id="login-options-sub">
                            <li>
                                <a target="_top" href="${utilitynavigation.siteroot }/stores/view-store.html">My Store</a>
                            </li>
                            <li>
                                <a x-cq-linkchecker="valid" target="_top" href="${utilitynavigation.siteroot }/tools/view-account.html">My Account</a>
                            </li>
                            <li>
                                <a target="_top" href="${utilitynavigation.siteroot }/shopping-list.html">My List</a>
                            </li>
                            <% PageManager manager = resourceResolver.adaptTo(PageManager.class); %>
                            <% if( manager.getPage(utilitynavigation.getSiteroot() + "/savings/view-coupon-status") != null) { %>
                            <li class="ecoupons-nav">
                                <a x-cq-linkchecker="valid" target="_top" href="${utilitynavigation.siteroot }/savings/view-coupon-status.html">My eCoupons</a>
                            </li>
                            <% } %>  
                            <li class="login-view-rewards">
                                <a href="${utilitynavigation.siteroot }/tools/view-rewards.html" target="_top">My Rewards</a>
                            </li>
                            <li class="pad">
                                <a target="_top" href="${utilitynavigation.siteroot }/savings/view-ads.html">Specials</a>
                            </li>
                            <li>
                                <a target="_top" href="${utilitynavigation.siteroot }/savings/view-coupons.html">Coupons</a>
                            </li>
                        </ul>
                    </div>
                </ul>
            </li>
            <li id="nav-acct-findastore">
              <a target="_top" href="${utilitynavigation.siteroot }/stores/search-stores.html" >Find a Store</a>
            </li> 
            <li id="nav-acct-customerservice">
                <a target="_top" href="${utilitynavigation.siteroot }/tools/customer-service.html" >Customer Service</a> 
            </li>
        </ul>
    </div>
    <script type="text/javascript">
        <%-- need this because IE is stupid and when you click on myTools it gives you a weird error --%>
        SVUMaster.toolsMenuPreventDefault = true;
    </script>
    </c:when>
    <c:otherwise>
    <div role="navigation">
        <ul class="loggedout" id="nav-account">
            <li>
                <a target="_top" href="${utilitynavigation.siteroot }/tools/signin.html">Sign In</a>
            </li>
            <li>
                <a target="_top" href="${utilitynavigation.siteroot }/tools/signup.html">Sign Up</a>
            </li>
            <li id="nav-acct-findastore">
                <a target="_top" href="${utilitynavigation.siteroot }/stores/search-stores.html" >Find a Store</a>
            </li> 
            <li id="nav-acct-customerservice">
                <a target="_top" href="${utilitynavigation.siteroot }/tools/customer-service.html" >Customer Service</a> 
            </li>
        </ul>
    </div>
    </c:otherwise>
</c:choose>