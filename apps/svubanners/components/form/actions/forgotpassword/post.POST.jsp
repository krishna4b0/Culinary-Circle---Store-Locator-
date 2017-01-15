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
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.forgotpassword.action.ForgotPasswordActionHandler,java.util.List" %><% 
%><%@include file="/apps/svubanners/global.jsp"%><%
	ForgotPasswordActionHandler forgotPasswordHandler = new ForgotPasswordActionHandler(pageContext);
	pageContext.setAttribute("forgotPasswordHandler", forgotPasswordHandler);
	
	List<String> errors=forgotPasswordHandler.validate();
	if(errors==null){
	    errors=forgotPasswordHandler.process();
	    if(errors!=null && errors.size()>0){
	      //redirect back to referrer with errors
		  response.sendRedirect(forgotPasswordHandler.getErrorRedirect(errors));
	      return;
	    }
	    //redirect to success page
	    response.sendRedirect(forgotPasswordHandler.getSuccessRedirect() + ".html");
	} else {
	    //redirect back to referrer with errors
	    response.sendRedirect(forgotPasswordHandler.getErrorRedirect(errors));
	    return;
	}
	
%>
