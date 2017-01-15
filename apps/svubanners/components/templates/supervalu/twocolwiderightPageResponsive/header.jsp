<%--
  Copyright 1997-2010 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Default header script.

  Builds the global header

  ==============================================================================

--%>
    <%@include file="/apps/svubanners/global.jsp" %>
        <%@page session="false"%>
            <div id="header">


                <div class="mobile-logo show-for-small-only">
                    <div class="row">
                        <div class="small-12 columns">
                            <img src="/content/dam/svubanners/cub/en/bg-header-logo.png" alt="Cub - Better Fresh, Better Value">
                        </div>
                    </div>
                </div>

                <div class="banner show-for-medium-up desktop-banner-container">
                    <div class="row">

                        <c:if test="${!template.hideTopBanner }">
                            <div id="top-banner" class="hideprint">
                                <cq:include path="${template.bannerImagePath }" resourceType="foundation/components/image" />
                            </div>
                        </c:if>

                        <cq:include path="headerImage" resourceType="foundation/components/image" />
                        <cq:include path="logo" resourceType="svubanners/components/navigation/logo" />

                        <cq:include path="${template.utilNavPath }" resourceType="svubanners/components/responsive/navigation/utilitynav" />

                        <div aria-hidden="true" class="site-search-container">
                            <form id="site-search" role="search" method="get" action="/search.html">
                                <label class="site-search-label" for="inp-search">Search</label>
                                <input id="inp-search" title="Search" placeholder="search" name="keyword">
                                <button class="site-search-button" type="submit">Submit</button>
                            </form>
                        </div>


                        <div class="main-nav-container">

                            <cq:include path="sitenav" resourceType="svubanners/components/responsive/navigation/sitenav" />

                        </div>

                    </div>
                </div>

                <script type="text/javascript">
                    SVUMaster.headerAjax = {};
                    SVUMaster.headerAjax.headerajaxReqUrl = '${template.mappedResourcePath}.header.';
                </script>
            </div>
            <!-- SimpleSignup -->
            <div class="ss-container">
                <div class="ss-overlay"></div>
            </div>