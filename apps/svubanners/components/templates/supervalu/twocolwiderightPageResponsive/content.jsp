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

  Default content script.

  Builds the main body content for a given page.

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false"%>
<div id="content">
    <div class="row breadcrumb-wrapper">    
        <cq:include script="breadcrumb.jsp" />
    </div>
    <div class="row">
        <div class="medium-2 hide-for-small columns sidebar-container">    
            <cq:include script="left.jsp" />
        </div>
        <div class="medium-10 columns show-coupons-container">
            <cq:include script="center.jsp" />
        </div>
    </div>
</div>
                                  

    