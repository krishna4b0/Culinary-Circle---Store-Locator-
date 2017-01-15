<%--

  Footer component.

  The page footer will be displayed on every page in te site.

--%>
    <%@include file="/apps/svubanners/global.jsp"%>
        <%@ page import="com.svu.bannersites.cq5.components.navigation.Footer"%>
            <%
try{
    Footer footer = new Footer(pageContext);
    pageContext.setAttribute("footer", footer);

%>
                <div class="footer">

                    <div class="row">
                        <cq:include path="middlefooterpar" resourceType="foundation/components/iparsys" />
                    </div>

                    <div class="row">

                        <div class="small-12 medium-5 medium-push-7 columns">
                            <c:if test="${bannerName == 'Cub Foods'}">
                                <p class="footer-lead">Sign up today</p>
                                <a class="cub-rewards-image" target="_blank" href="/content/svubanners/cub/en/tools/rewards-cards.html">
                                    <img alt="Signup-today" src="/etc/designs/svubanners/master/img/img-rewards-card.png">
                                </a>
                                <div class="cub-rewards-text">
                                    <p>Use your MY CUB REWARDS Card every time you shop at any one of our MN Cub locations.</p>
                                </div>
                            </c:if>
                        </div>

                        <div class="small-6 medium-4 medium-pull-5 columns">

                            <div id="fb-root"></div>
                            <script>
                                (function (d, s, id) {
                                    var js, fjs = d.getElementsByTagName(s)[0];
                                    if (d.getElementById(id)) return;
                                    js = d.createElement(s);
                                    js.id = id;
                                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=${footer.fbId}";
                                    fjs.parentNode.insertBefore(js, fjs);
                                }(document, 'script', 'facebook-jssdk'));
                            </script>


                            <c:if test="${(not empty footer.twUrl or not empty footer.fbUrl ) and bannerSpecifier !='hornbachers'}">
                                <p class="footer-lead">Join Us</p>
                                <div class="social-buttons">
                                    <c:if test="${not empty footer.fbUrl and bannerSpecifier !='hornbachers'}">
                                        <a class="facebook-button" href="${footer.fbUrl }" target="_blank" title="Find us on Facebook">
                                            <img src="/etc/designs/svubanners/master/img/icn-facebook.png" alt="Find us on Facebook" />
                                        </a>
                                    </c:if>
                                    <c:if test="${not empty footer.twUrl and bannerSpecifier !='hornbachers'}">
                                        <a class="twitter-button" target="_blank" title="Find us on Twitter" href="${footer.twUrl }">
                                            <img alt="" src="/etc/designs/svubanners/master/img/img-social-twitter.png" alt="Find us on Twitter">
                                        </a>
                                    </c:if>
                                </div>
                                <c:if test="${not empty footer.fbUrl and bannerSpecifier !='hornbachers'}">
                                    <div class="fb-like" data-height="18" style="padding-top:30px;" data-colorscheme="light" data-layout="standard" data-action="like" data-show-faces="true" data-send="true"></div>
                                </c:if>
                            </c:if>
                        </div>


                        <div class="small-6 medium-3 medium-pull-5 columns">
                            <c:if test="${not empty footer.itunesUrl or not empty footer.androidUrl}">
                                <p class="footer-lead footer-lead-mobile">Mobile App</p>
                                <c:if test="${not empty footer.itunesUrl}">
                                    <a target="_blank" href="${footer.itunesUrl }" id="iph-img">
                                        <img alt="Download our mobile app for IPhone" src="/etc/designs/svubanners/master/images/img-app-ios.png" width="80" height="32">
                                        <br>

                                    </a>
                                </c:if>
                                <c:if test="${not empty footer.androidUrl}">
                                    <a target="_blank" href="${footer.androidUrl }" id="and-img">
                                        <img alt="Download our mobile app for Android" src="/etc/designs/svubanners/master/images/img-app-android.png" width="80" height="32">
                                    </a>
                                </c:if>
                            </c:if>
                        </div>

                    </div>


                    <div class="row">
                        <!-- necessary grouping element -->

                        <div class="footer-navigation-container">
                            <ul class="footer-nav">
                                <li><a href="${footer.siteRoot }/tools/customer-service.html" target="_top">Customer Service</a></li>
                                <li><a href="${footer.siteRoot }/about.html" target="_top">About Us</a></li>
                                <li><a href="${footer.siteRoot }/about/careers.html" target="_top">Careers</a></li>
                                <li><a href="${footer.siteRoot }/about/product-recalls.html" target="_top">Recalls</a></li>
                                
                                <% PageManager manager = resourceResolver.adaptTo(PageManager.class); %>
                                            
                                            <li><a href="${footer.siteRoot }/about/security-privacy.html" target="_top">Privacy Policy</a></li>
                                            <li><a href="${footer.siteRoot }/about/terms-and-conditions.html" target="_top">Terms of Use</a></li>
                                            <li><a href="#" class="ss-associates-link" target="_top">Associates</a></li>
                            </ul>
                            <p class="footer-copyright">Copyright &copy; ${footer.currentYear}&nbsp;${footer.copyrightText} All rights reserved.</p>
                        
                        </div>
                    </div>
                </div>

                <script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.2/js/foundation.js"></script>
                <script>
                    $(document).ready(function () {
                        
                        //todo: figure out why AEM moves this when it's just in the template.
                        $('.inner-wrap').append('<a class="exit-off-canvas"></a>');
                        
                        $(document).foundation();


                        //todo: refactor this and move it into JS file.
                        var isMobileNavVisible = $('.mobile-logo').is(":visible");
                        var navHeight = $(".mobile-header nav.tab-bar").height() || 0;
                        if (isMobileNavVisible) {
                            $('.content-area').css('padding-top', navHeight + 25);
                        }
                        
                        
                        //selectively applying class to body tag for responsive styling
                        var windowWidth = $(window).width();
                        
                        function setResponsiveClass(windowWidth){
                            
                            var classMobile = "responsiveMobile",
                                classTablet = "responsiveTablet",
                                classDesktop = "responsiveDesktop";
                            
                                    console.log(windowWidth);

                                if(windowWidth < 640){
                                    console.log('here first');
                                    $('body').addClass(classMobile).removeClass(classTablet + " " + classDesktop);
                                } else if(windowWidth < 1024){
                    
                                    $('body').addClass(classTablet).removeClass(classMobile + " " + classDesktop);
                                } else {
                                    
                                    //all other sizes bigger than tablet
                                    //$('body').addClass(classDesktop).removeClass(classTablet + " " + classMobile);
                                }
                        }
                        
                        setResponsiveClass(windowWidth);
                        console.log('mic check');
                        
                    
                        $(window).on('resize', function () {
                            if (!isMobileNavVisible && $('.mobile-logo').is(":visible")) {
                                $('.content-area').css('padding-top', (navHeight + 25));
                                isMobileNavVisible = true;
                            } else if (!$('.mobile-logo').is(":visible")) {
                                $('.content-area').css('padding-top', 0);
                                isMobileNavVisible = false;
                                $('.off-canvas-wrap').foundation('offcanvas', 'hide', 'move-right');
                            }
                            
                            setResponsiveClass($(window).width());
                        });

                        $(document.body).on("click", ".mobile-expand", function (e) {
                            e.preventDefault();
                            //switch out + or - for expanded content
                            var slideMenu = $(this).closest('li').find('ul');
                            if (!$(slideMenu).is(":visible")){
                                $(this).html("-");
                            } else {
                                $(this).html("+");
                            }
                            slideMenu.slideToggle();
                        });
                    });
                </script>

                <%
    } catch (Exception e){
        log.error("An Exception occurred while rendering the contextual nav.",e);
        %>An error has occurred while rendering the contextual navigation. Most likely, this is because the current page is not a child of a Site Configuration Page.
                    <%
    }
%>