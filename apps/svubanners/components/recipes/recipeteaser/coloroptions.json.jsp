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

  Compiles a JSON-formatted list of the available display options to
  draw list items.

--%><%
%><%@ page import="org.apache.sling.api.resource.ValueMap,
					org.apache.sling.api.resource.Resource" session="false" %><%
%><%@include file="/apps/svubanners/global.jsp"%><%

    response.setContentType("text/plain");

%>[<%
	String[] colorOptions = currentStyle.get("colors",String[].class);
	if(colorOptions!=null){
	    String delim="";
	    for(String color : colorOptions){
    %>
	    <%=delim %>
	    {
	    	"text":"<%=color %>",
	    	"value":"<%=color %>"
	    }	
	    <%
	    delim=",";
	    }
    } 
    %>
]