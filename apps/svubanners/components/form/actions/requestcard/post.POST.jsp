<%--
  Copyright 1997-2010 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.
  --%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.actions.RequestCardFormActionHandler,java.util.List"%>
<%@include file="/apps/svubanners/global.jsp"%><%
	RequestCardFormActionHandler requestCard = new RequestCardFormActionHandler(pageContext);
	pageContext.setAttribute("requestCard", requestCard);
	List<String> errors = requestCard.validate();
	if(errors==null || errors.size()==0) {
	    errors=requestCard.process();
	    if(errors!=null && errors.size()>0) {
	        response.sendRedirect(slingRequest.getResourceResolver().map(requestCard.getRedirectErrorPath() + ".html?") + requestCard.getRedirectQueryString(errors));
		    return;
	    }else{
	        response.sendRedirect(slingRequest.getResourceResolver().map(requestCard.getRedirectSuccessPath()));
	        return;
	    }
	    
	} else {
	    response.sendRedirect(slingRequest.getResourceResolver().map(requestCard.getRedirectErrorPath() + ".html?") + requestCard.getRedirectQueryString(errors));
	}
%>