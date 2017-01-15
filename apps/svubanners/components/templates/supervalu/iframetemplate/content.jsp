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
<div id="wrapper-content">  

    <!--[if lte IE 8 ]>
        <iframe id="iframe_content" width="${template.width }" src="${template.iframeSource }" height="${template.height }">
          <p>Your browser does not support iframes.</p>
        </iframe>
    <![endif]-->  

    <!--[if gt IE 8 ]>
        <iframe id="iframe_content" width="${template.width }" src="${template.iframeSource }" height="${template.height }">
          <p>Your browser does not support iframes.</p>
        </iframe>
    <![endif]-->
    
    <!--[if !IE]><!-->
        <iframe id="iframe_content" width="${template.width }" src="${template.iframeSource }" height="${template.height }">
            <p>Your browser does not support iframes.</p>
        </iframe>
    <!--<![endif]-->

    <cq:include path="par" resourceType="foundation/components/parsys" />
</div>

<script type="text/javascript">
  // This makes the page properties available to JS
  var pageProps = {iframeSource: "${template.iframeSource}",
                   height: "${template.height}",
                   width: "${template.width}"};
</script>

<!-- Note: Change the script below to easyXDM.debug.js for testing/debugging
<script type="text/javascript" src="/etc/designs/svubanners/master/js/easyXDM/easyXDM.debug.js"></script>
-->

<!-- Commenting due to problems with EasyXDM
<script type="text/javascript" src="/etc/designs/svubanners/master/js/easyXDM/easyXDM.min.js"></script>
<script type="text/javascript" src="/etc/designs/svubanners/master/js/iframeAutosize.js"></script>
-->
