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
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.actions.RemoveRewardsCard,java.util.List"%>
<%@include file="/apps/svubanners/global.jsp"%><%
	RemoveRewardsCard removeCard = new RemoveRewardsCard(pageContext);
	pageContext.setAttribute("removeCard", removeCard);
	List<String> errors = removeCard.validate();
	if(errors==null || errors.size()==0) {
	    removeCard.process();
	    response.sendRedirect(slingRequest.getResourceResolver().map(removeCard.getRedirectSuccessPath() + ".html"));
	} else {
	    response.sendRedirect(slingRequest.getResourceResolver().map(removeCard.getRedirectErrorPath() + ".html?") + removeCard.getRedirectQueryString(errors));
	}
%>

