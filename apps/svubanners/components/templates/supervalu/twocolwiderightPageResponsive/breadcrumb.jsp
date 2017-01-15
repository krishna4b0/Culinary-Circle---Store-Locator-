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

  Renders the breadcrumb bar that is part of every content page

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false"%>
<div class="medium-8 columns breadcrumb-container">
	<cq:include path="breadcrumb" resourceType="svubanners/components/responsive/navigation/breadcrumb" />
</div>
<div class="medium-4 columns mystore-container hide-for-small-only">
    <cq:include path="mystore" resourceType="svubanners/components/responsive/navigation/mystore" />
</div>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url: '${template.mappedResourcePath}.breadcrumbajax.html',
		cache: false,
		success: function(data){
			$('#store-name').replaceWith(data);
		},
		dataType: 'html'
	});
});
</script>
