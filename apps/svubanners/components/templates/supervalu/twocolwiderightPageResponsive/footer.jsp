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

  Default footer script.

  Simply includes the footer component relevant to the given page type.  Also includes scriptLibs.jsp

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false"%>
<cq:include path="footer" resourceType="svubanners/components/responsive/navigation/footer" />
<c:if test="${template.storeSelectionPopup}">
<script type="text/javascript">
 $(document).ready(function(){
	if($.cookie('anonymousStore') == 'true' ){
		invokeStoreSelectionPopup('${template.mappedResourcePath}.storeFancyBox.html');
	}
 });
 </script>
 </c:if>
