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
	<ul class="nav-primary" role="navigation">
       
		<c:forEach var="pages" items="${sitenav.pages}">
            <c:choose>
                <c:when test="${not empty pages.children}">
                        <li class="has-dropdown"><a href="${pages.linkPath}" target="_top">${pages.navigationTitle}<div class="mobile-expand">+</div></a> 
                                <ul role="navigation" class="dropdown">
                                     <c:forEach var="children" items="${pages.children }">
                                        <li><a href="${children.linkPath }" target="_top">${children.navigationTitle}</a></li>
                                     </c:forEach> 
                            </ul>
                        </li>        
                </c:when>    
                <c:otherwise>
                        <li><a href="${pages.linkPath}" target="_top">${pages.navigationTitle}</a></li>           
                </c:otherwise>
            </c:choose>            
		</c:forEach>
		 <li class="sample"><a>
        <div aria-hidden="true" class="site-search-container">
                           
                           
                            <form id="site-search" role="search" method="get" action="${sitenav.siteroot }/search.html">
                                <label class="site-search-label" for="inp-search">Search</label>
                                <input id="inp-search" title="Search" placeholder="search" name="keyword">
                                <button class="site-search-button" type="submit" onclick="if(validate(event) && typeof _gaq != 'undefined')//_gaq.push(['_trackEvent', '${currentPage.title }', 'sitenav', 'Submit']);">Submit</button>
                            </form>
                        </div>
		</a>
		</li>
		
	</ul>
</c:if>
<%
	} catch (Exception e){
	    log.error("An Exception occurred while rendering the contextual nav.",e);
		%>An error has occurred while rendering the contextual navigation.  Most likely, this is because the current page is not a child of a Site Configuration Page.<%
	}
%>