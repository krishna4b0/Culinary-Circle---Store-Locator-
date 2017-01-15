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
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.actions.ReplaceRewardsCard,java.util.List"%>
<%@include file="/apps/svubanners/global.jsp"%><%
	ReplaceRewardsCard replaceCard = new ReplaceRewardsCard(pageContext);
	pageContext.setAttribute("replaceCard", replaceCard);
	List<String> errors = replaceCard.validate();
	if(errors==null || errors.size()==0) {
	    errors=replaceCard.process();
	    if(errors!=null && errors.size()>0) {
	        response.sendRedirect(slingRequest.getResourceResolver().map(replaceCard.getRedirectErrorPath() + ".html?") + replaceCard.getRedirectQueryString(errors));
	        return;
	    }
	    response.sendRedirect(slingRequest.getResourceResolver().map(replaceCard.getRedirectSuccessPath()));
        return;

	} else {
	    response.sendRedirect(slingRequest.getResourceResolver().map(replaceCard.getRedirectErrorPath() + ".html?") + replaceCard.getRedirectQueryString(errors));
	    return;
	}
%>