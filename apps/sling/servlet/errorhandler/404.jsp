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

  Generic 404 error handler

  Important note:  
  Since Sling uses the user from the request (depending on the authentication
  handler but typically HTTP basic auth) to login to the repository and JCR/CRX
  will simply say "resource not found" if the user does not have a right to
  access a certain node, everything ends up in this 404 handler, both access
  denied ("401", eg. for non-logged in, anonymous users) and really-not-existing
  scenarios ("404", eg. logged in, but does not exist in repository).
  
--%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@ page session="false" import="com.svu.bannersites.cq5.components.error.ErrorHandlerComponent,
								   org.apache.sling.engine.auth.Authenticator,
								   org.apache.sling.api.request.RequestProgressTracker,
			    				   org.apache.sling.api.SlingConstants,
			   					   org.apache.sling.api.request.ResponseUtil,
			    				   java.io.PrintWriter,
			    				   java.lang.Throwable" %><%
try {
	ErrorHandlerComponent errorComp = new ErrorHandlerComponent(pageContext);
    pageContext.setAttribute("errorComp",errorComp);
          
    if(errorComp.isAnonymousRequest() && errorComp.isBrowserRequest() && !errorComp.isPublishMode()){
        if(errorComp.processAuthHandler() != null){
            return;
        }
    }
    
    //if we get to this point, didn;t return, its a real error, so handle the pig
    response.setStatus(errorComp.getStatusCode());
    response.setContentType("text/html"); 
    response.setCharacterEncoding("utf-8");
    response.setHeader("Dispatcher", "no-cache");
%>
<c:choose>
	<c:when test="${not errorComp.publishMode }">
	<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
	<html>
		<head><title>${errorComp.statusCode } ${errorComp.statusMessage }</title></head>
		<body>
			<h1>${errorComp.statusMessage }</h1>
			 <p>Cannot serve request to ${errorComp.escapedRequestURI}
			 	<c:choose>
			 		<c:when test="${not empty errorComp.escapedErrorServletName }">
			 		in ${errorComp.escapedErrorServletName }
			 		</c:when>
			 		<c:otherwise>
			 		on this server
			 		</c:otherwise>
			 	</c:choose>
			 </p>
			 <%
				final PrintWriter escapingWriter = new PrintWriter(ResponseUtil.getXmlEscapingWriter(out));
				    
	            // dump the stack trace
	            if (request.getAttribute(SlingConstants.ERROR_EXCEPTION) instanceof Throwable) {
	                Throwable throwable = (Throwable) request.getAttribute(SlingConstants.ERROR_EXCEPTION);
	                out.println("<h3>Exception:</h3>");
	                out.println("<pre>");
	                out.flush();
	                errorComp.printStackTrace(escapingWriter, throwable);
	                escapingWriter.flush();
	                out.println("</pre>");
	            }
	    
	            // dump the request progress tracker
	            if (slingRequest != null) {
	                RequestProgressTracker tracker = slingRequest.getRequestProgressTracker();
	                out.println("<h3>Request Progress:</h3>");
	                out.println("<pre>");
	                out.flush();
	                tracker.dump(escapingWriter);
	                escapingWriter.flush();
	                out.println("</pre>");
	            }
			 %>
		</body>
	</html>
	</c:when>
	<c:when test="${not empty errorComp.servletErrorPath }">
	<sling:forward path="${errorComp.servletErrorPath }" />
	</c:when>
	<c:otherwise>
	<%-- publish instance, but can't find a servlet error path. --%>
	<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
	<html>
		<head><title>${errorComp.statusCode } ${errorComp.statusMessage }</title></head>
		<body>
			<h1>${errorComp.statusMessage }</h1>
			 <p>Sorry, we cannot serve request to ${errorComp.escapedRequestURI} at this time.</p>
		</body>
	</html>		
	</c:otherwise>
</c:choose>
<%
} catch (Throwable t){
    log.error("error in 404 error handler.",t);
    
    response.setStatus(500);
    response.setContentType("text/html"); 
    response.setCharacterEncoding("utf-8");
%>
    <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
	<html>
		<head><title>${errorComp.statusCode } ${errorComp.statusMessage }</title></head>
		<body>
			<h1>A Fatal Error has occurred.</h1>
			 <p>Sorry, we cannot serve request to ${errorComp.escapedRequestURI} at this time.</p>
		</body>
	</html>	
<%
}

%>