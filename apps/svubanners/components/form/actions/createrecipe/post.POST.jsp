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
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.actions.CreateRecipe"%>
<%@include file="/apps/svubanners/global.jsp"%><%
	CreateRecipe createRecipe = new CreateRecipe(pageContext);
	pageContext.setAttribute("createRecipe", createRecipe);
	
	if(createRecipe.validate()) {
	    createRecipe.createRecipe();
	    response.sendRedirect(slingRequest.getResourceResolver().map(createRecipe.getRecipeBoxPath() + ".html"));
	} else {
	    response.sendRedirect(slingRequest.getResourceResolver().map(currentPage.getPath() + ".html?errors=NO_RECIPE_TITLE"));
	}
	

	
%>

