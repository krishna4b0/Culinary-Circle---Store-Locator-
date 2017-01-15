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

  Three-Column Center Content Script

  Builds the main content area for a page.

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false"%>
<div id="content-primary">

	<cq:include path="storedata" resourceType="svubanners/components/store/storedata" />
	<div class="containers">
		<div  name="DivControl4278" id="divcontainer1">
			<p></p>								
			<cq:include script="storepromotions.jsp"/>
			<c:choose>
				<c:when test="${empty template.storeId}">
				</c:when>
				<c:when test="${template.storeContentAuthorable }">
				<cq:include script="storecontent.jsp" />
				</c:when>
				<c:otherwise>
					<c:if test="${template.authoredStoreContentPageExists }">
					<sling:include path="${template.authoredStoreContentPagePath }" replaceSelectors="storecontent" />
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
		<cq:include path="storefeatures" resourceType="svubanners/components/store/storefeatures" />
	</div>
	<script type="text/javascript">
	var bannerName = "<c:out value='${bannerName}'/>";
  </script>
</div>