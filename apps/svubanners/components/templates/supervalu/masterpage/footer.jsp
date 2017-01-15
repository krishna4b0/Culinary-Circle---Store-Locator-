<%--

  Footer component.

  The page footer will be displayed on every page in te site.

--%><%@include file="/apps/svubanners/global.jsp"%>
<%@ page import="com.svu.bannersites.cq5.components.navigation.Footer"%><%
try{
    Footer footer = new Footer(pageContext);
    pageContext.setAttribute("footer", footer);

%>
<div id="footer">
    <div id="top-row">
        <cq:include path="middlefooterpar" resourceType="foundation/components/iparsys" />
    </div>
    <div class="middle_row">

        <div class="column-1">
            <div id="fb-root">&nbsp;</div>
            <script>(function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=${footer.fbId}";
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
            </script>
            <c:if test="${(not empty footer.twUrl or not empty footer.fbUrl ) and bannerSpecifier !='hornbachers'}">
            <p class="lead">Join Us</p>
            <div class="followonfb">
            <c:if test="${not empty footer.fbUrl and bannerSpecifier !='hornbachers'}">
                <a href="${footer.fbUrl }" target="_blank">
                    <img alt="Find us on Facebook - Opens in New Window" src="/etc/designs/svubanners/master/img/icn-facebook.png"/>
                </a>
                </c:if>
            <c:if test="${not empty footer.twUrl and bannerSpecifier !='hornbachers'}">
            <a target="_blank" href="${footer.twUrl }" id="twitter-img">
                <img alt="alt="Follow on Twitter - Opens in New Window"" src="/etc/designs/svubanners/master/img/img-social-twitter.png" width="30" height="30">
            </a>
            </c:if>
            </div>
            <c:if test="${not empty footer.fbUrl and bannerSpecifier !='hornbachers'}">
            <div class="fb-like" data-height="18" data-colorscheme="light" data-layout="standard" data-action="like" data-show-faces="true" data-send="true"></div>
            </c:if>
            </c:if>
        </div>
        <c:if test="${not empty footer.itunesUrl or not empty footer.androidUrl}">
        <div class="column-2">
            <p class="lead">Mobile App</p>
            <c:if test="${not empty footer.itunesUrl}">
            <a target="_blank" href="${footer.itunesUrl }" id="iph-img">
                <img alt="Download our mobile app for IPhone - Opens in New Window" src="/etc/designs/svubanners/master/images/img-app-ios.png" width="80" height="32">
            </a> <br/>
            </c:if>
            <c:if test="${not empty footer.androidUrl}">
            <a target="_blank" href="${footer.androidUrl }" id="and-img">
                <img alt="Download our mobile app for Android - Opens in New Window" src="/etc/designs/svubanners/master/images/img-app-android.png" width="80" height="32">
            </a>
            </c:if>
        </div>
        </c:if>
        <c:if test="${bannerName == 'Cub Foods'}">
        <div class="column-3">
            <p class="lead">Sign up today</p>
            <a target="_blank" href="/content/svubanners/cub/en/tools/rewards-cards.html">
                <img alt="Signup-today" src="/etc/designs/svubanners/master/img/img-rewards-card.png" >
            </a> 
            <p>Use your MY CUB REWARDS Card every time you shop at any one of our MN Cub locations.</p>
        </div>
        </c:if>
    </div>


    <div id="bottom_row">
        <div><!-- necessary grouping element -->

            <ul>
                <li class="no_border"><a href="${footer.siteRoot }/tools/customer-service.html" target="_top">Customer Service</a></li>
        <li><a href="${footer.siteRoot }/about.html" target="_top">About Us</a></li>
        <li><a href="${footer.siteRoot }/about/careers.html" target="_top">Careers</a></li>
                <li><a href="${footer.siteRoot }/about/product-recalls.html" target="_top">Recalls</a></li>
                <% PageManager manager = resourceResolver.adaptTo(PageManager.class); %>
                <% if( manager.getPage(footer.getSiteRoot() + "/about/transparency") != null) { %>
                    <li id="supply"><a href="${footer.siteRoot }/about/transparency.html" target="_top">Supply Chain Transparency</a></li>
                <% } %> 
                <li><a href="${footer.siteRoot }/about/security-privacy.html" target="_top">Privacy Policy</a></li>
                <li><a href="${footer.siteRoot }/about/terms-and-conditions.html" target="_top">Terms of Use</a></li>
                <li><a href="#" class="ss-associates-link" target="_top">Associates</a></li>
            </ul>
            <p>Copyright &copy; ${footer.currentYear}&nbsp;${footer.copyrightText} All rights reserved.</p>
        </div>
    </div>
</div>




<%
    } catch (Exception e){
        log.error("An Exception occurred while rendering the contextual nav.",e);
        %>An error has occurred while rendering the contextual navigation.  Most likely, this is because the current page is not a child of a Site Configuration Page.<%
    }
%>