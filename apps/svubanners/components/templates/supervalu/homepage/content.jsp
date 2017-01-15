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
<div id="content" class="one-col">
	<div id="homepanel01" class="homepanel">
		<cq:include path="featurenav" resourceType="svubanners/components/navigation/featurenav" />
    <%--
		<cq:include path="featureImage" resourceType="svubanners/components/general/postCard" />
    --%>
	    <div class="featureImage">
	      <cq:include path="homepageHero" resourceType="foundation/components/parsys" />
	    </div>
	</div>

	
	<div id=homepanel02 class=homepanel>
		<div class=homepanel_content>
			<cq:include path="homepagePar" resourceType="foundation/components/parsys" />
		</div>
	</div>
</div>