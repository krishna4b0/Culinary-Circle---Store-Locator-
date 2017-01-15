<%--

  Site Navigation component.
  
  The Site Navigation renders the main navigation for the entire site as categorical drop down lists




--%><%@include file="/apps/svubanners/global.jsp"%>
<%@ page import="com.svu.bannersites.cq5.components.navigation.SiteNav"%><%

try{
	SiteNav sitenav = new SiteNav(pageContext);
	pageContext.setAttribute("sitenav", sitenav);
%>

<c:if test="${not empty sitenav.pages }">
<div role="navigation">
	<ul id="nav-primary">
		<c:forEach var="pages" items="${sitenav.pages}">
			<li id="nav-pri-${pages.page.name}" class="no_border"><a href="${pages.linkPath}" target="_top">${pages.navigationTitle}</a> 
				<c:if test="${not empty pages.children}">
                    <div role="navigation">
                        <ul class="nav-drop-down">
                             <c:forEach var="children" items="${pages.children }">
                                <li><a href="${children.linkPath }" target="_top">${children.navigationTitle}</a></li>
                             </c:forEach> 
                        </ul>
					</div>
				</c:if>	
			</li>
		</c:forEach>
			<li id="nav-pri-search">
				<form id=frm-search role="search" method="get" action="${sitenav.siteroot }/search.html">
                    <label class="visually-hidden" for="inp-search">Search</label> 
					<input id="inp-search" title="Search" placeholder="search" name="inp-search">
					<button type="submit" onclick="if(validate(event) && typeof _gaq != 'undefined')//_gaq.push(['_trackEvent', '${currentPage.title }', 'sitenav', 'Submit']);">Submit</button> 
				</form>
			</li>
		
	</ul>
</div>
</c:if>
<%
	} catch (Exception e){
	    log.error("An Exception occurred while rendering the contextual nav.",e);
		%>An error has occurred while rendering the contextual navigation.  Most likely, this is because the current page is not a child of a Site Configuration Page.<%
	}
%>