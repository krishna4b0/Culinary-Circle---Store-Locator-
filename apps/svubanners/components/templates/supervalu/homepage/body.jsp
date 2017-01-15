<%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Default body script.

  Draws an empty HTML body.

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false"%>
<body>

    <!-- Google Tag Manager -->
<!--   <noscript><iframe src="//www.googletagmanager.com/ns.html?id=${googleTagManagerId}"
  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript> -->
  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','dataLayer',SVUMaster.googleTagManagerId);</script>
  
  <!-- End Google Tag Manager -->
  
	<div id="layout">
        <cq:include path="sociallogin" resourceType="svubanners/components/social/sociallogin"/>
		<cq:include script="header.jsp"/>
		<cq:include script="content.jsp"/>
		<cq:include script="footer.jsp"/>
	</div>
	<cq:include script="scriptLibs.jsp"/>
</body>