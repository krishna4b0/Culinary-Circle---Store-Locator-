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
%><%@ page import="com.svu.bannersites.cq5.components.general.Text" session="false" %><%
%><%@include file="/apps/svubanners/global.jsp"%><%

    response.setContentType("text/plain");

%>[<%
        
        Text textComp = new Text(pageContext);
        pageContext.setAttribute("textComp",textComp);
        String delim="";
    %>
    <c:forEach var="entry" items="${textComp.storeGroups }">
    <%=delim %>
    {
    	"text":"${entry.key }",
    	"value":"${entry.value }"
    }	
    <%
    delim=",";
    %>
    </c:forEach>
]