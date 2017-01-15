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

  Default script libraries scruot.

  Includes all js script libraries (ie. jquery) that are template specific.

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false" %>
<script src="<%=masterDesignPath %>/js/googlemap.js" type="text/javascript"></script>
<script src="<%=masterDesignPath %>/js/stores.js" type="text/javascript"></script>
<script type="text/javascript">
    var googleAPIKey = "gme-supervaluinc";
    var mapData = "client";
    $(document).ready(function() {
        initMapToggle();
    });
</script>