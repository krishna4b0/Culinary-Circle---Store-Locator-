<%--

  Footer component.

  The page footer will be displayed on every page in te site.

--%><%@include file="/apps/svubanners/global.jsp"%>
<%@ page import="com.svu.bannersites.cq5.components.navigation.Footer"%><%
try{
	Footer footer = new Footer(pageContext);
	pageContext.setAttribute("footer", footer);

%>
<div id="footer">
	<div id="top_row">
		<div><!-- necessary grouping element -->
			<div class="column-1">
			
			<p class="lead">Join Us</p>
			<a target="_blank" href="${footer.fbUrl }">
				<img alt="Visit our Facebook page" src="/etc/designs/svubanners/master/images/img-social-facebook.png" width="18" height="18">
			</a>
			<!--  
			<a target="_blank" href="${footer.twUrl }">
				<img alt="" src="/etc/designs/svubanners/master/images/img-social-twitter.png" width="18" height="18">
			</a>
			
			<a target="_blank" href="${footer.ytUrl }">
				<img alt="" src="/etc/designs/svubanners/master/images/img-social-youtube.png" width="18" height="18">
			</a> 
			-->
			
			<p class="lead">Mobile App</p>
			<a target="_blank" href="${footer.itunesUrl }">
				<img alt="Download our mobile app for IPhone" src="/etc/designs/svubanners/master/images/img-app-ios.png" width="80" height="32">
			</a> <br>
			<a target="_blank" href="${footer.androidUrl }">
				<img alt="Download our mobile app for Android" src="/etc/designs/svubanners/master/images/img-app-android.png" width="80" height="32">
			</a>
			</div>
			<%
				int columnWidth = 800 / footer.getPages().size();
			
			%>
			<c:if test="${not empty footer.pages }">
				<c:forEach var="pages" items="${footer.pages}" varStatus="index">
					<div class="column-${index.count+1 }" style="width: <%=columnWidth %>px;">
						<a class="lead" href="${pages.linkPath }">${pages.navigationTitle}</a>
						<c:if test="${not empty pages.children }">
							<ul>
							<c:forEach var="children" items="${pages.children }">
								<li><a href="${children.linkPath }">${children.navigationTitle}</a></li>
							</c:forEach>
							</ul>
						</c:if>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div id="bottom_row">
		<div><!-- necessary grouping element -->
			
			<ul>
				<li class="no_border"><a href="${footer.siteRoot }/tools/customer-service.html" target="_top">Customer Service</a></li>
				<li><a href="${footer.siteRoot }/about/product-recalls.html" target="_top">Recalls</a></li>
				<% PageManager manager = resourceResolver.adaptTo(PageManager.class); %>
                <% if( manager.getPage(footer.getSiteRoot() + "/about/transparency") != null) { %>
                <li><a href="${footer.siteRoot }/about/transparency.html" target="_top">Supply Chain Transparency</a></li>
                <% } %> 
				<li><a href="${footer.siteRoot }/about/security-privacy.html" target="_top">Privacy Policy</a></li>
				<li><a href="${footer.siteRoot }/about/terms-and-conditions.html" target="_top">Terms of Use</a></li>
			</ul>
			<p>Copyright © ${footer.currentYear }&nbsp;${footer.copyrightText } All rights reserved.</p>
		</div>
	</div>
</div>
	

<%
	} catch (Exception e){
	    log.error("An Exception occurred while rendering the contextual nav.",e);
		%>An error has occurred while rendering the contextual navigation.  Most likely, this is because the current page is not a child of a Site Configuration Page.<%
	}
%>