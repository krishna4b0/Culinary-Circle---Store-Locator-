<%--

	Component for retrieving and displaying Site Search Results

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.search.SiteSearchResults"%><%
%><%
	SiteSearchResults searchResults = new SiteSearchResults(pageContext);
	pageContext.setAttribute("searchResults", searchResults);
%>
<div class="typical">
	<h1>Search</h1>
	<form method="GET" id="frm-searchrefine" action="${currentPage.path}.html">
		<input value="${fn:escapeXml(searchResults.keyword) }" type="text" title="Search" name="keyword">
		<input type="hidden" value="${fn:escapeXml(searchResults.displayCount) }" name="displayCount" >
		<button type="submit" id="btn-searchrefine" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'sitesearchresults', 'Search']);">Search</button>
	</form>
	<hr style="clear: left;" />
	&nbsp;
	<c:choose>
		<c:when test="${ empty searchResults.results }">
			<h4><strong>We apologize, we couldn't find any results matching your search term(s).</strong></h4>
			<ol>
				<li>Oops, is it spelled correctly? Please make sure the words you are searching for are spelled correctly.</li>
				<li>Expand your search to use more terms, then let us do the work. Use more words to let us know exactly what you're trying to find.</li>
				<li>Try using "like" terms to help us further define your search.</li> 
			</ol>
		</c:when>
		<c:otherwise>
		<ul id="filter-results-info">
			<li class="results-count">Results ${searchResults.startRecord + 1 } to ${searchResults.endRecord } of ${searchResults.totalResults }</li>
			<c:choose>
				<c:when test="${searchResults.displayCount==50}">
					<li>Show <a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=10">10</a></li>
					<li><a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=25">25</a></li>
					<li class="last">50</li>
				</c:when>
				<c:when test="${searchResults.displayCount==25}">
					<li>Show <a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=10">10</a></li>
					<li>25</li>
					<li class="last"><a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=50">50</a></li>
				</c:when>
				<c:otherwise>
					<li>Show 10</li>
					<li><a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=25">25</a></li>
					<li class="last"><a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=50">50</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<ul class="searchresults">
			<c:forEach var="result" items="${searchResults.results }">
				<li>
					<h2><a x-cq-linkchecker="valid" href="${result.url }"><b>${result.title }</b></a></h2>
					<p>
					...${result.content }...
					<span><a href="${result.url }">${result.url }</a></span>
					</p>
				</li>
			</c:forEach>
		</ul>
		</c:otherwise>
	</c:choose>
</div>
<c:if test="${ not empty searchResults.results }">
	<div>
		<div class="pagination">
			<ul>
				<li class="previous">
					<c:if test="${searchResults.page != 1}">
					<a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=${fn:escapeXml(searchResults.displayCount) }&amp;page=${fn:escapeXml(searchResults.page) - 1}">
					</c:if>
					Previous
					<c:if test="${searchResults.page != 1}">
					</a>
					</c:if>
				</li>
				<li class="pages">Page:
					<ol>
						<c:set var="prevPage" value="1" />
						<c:forEach var="pageIndex" items="${searchResults.pagination}">
							<%--if the previous Page isn't directly adjacent, show the ... --%>
							<c:if test="${(prevPage + 1) != pageIndex }">
							<li>...</li>
							</c:if>
							
							<%--determine if it's the current page or not; output the appropriate li start tag, and the a tag if needed --%>
							<c:choose>
								<c:when test="${pageIndex == searchResults.page}">
								<li class="current-page">${pageIndex }
								</c:when>
								<c:otherwise>
								<li><a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=${fn:escapeXml(searchResults.displayCount) }&amp;page=${pageIndex }">${pageIndex }</a>
								</c:otherwise>
							</c:choose>
							
							<%--output the li end tag that was opened in the choose statement above --%>
							</li>
							
							<%--set prevPage for the next iteration --%>
							<c:set var="prevPage" value="${pageIndex }" />
						</c:forEach>
					</ol>
				</li>
				<li class="next">
					<c:if test="${searchResults.page != searchResults.lastPage}">
						<a href="${currentPage.path }.html?keyword=${fn:escapeXml(searchResults.keyword) }&amp;displayCount=${fn:escapeXml(searchResults.displayCount) }&amp;page=${fn:escapeXml(searchResults.page) + 1}">
					</c:if>
					Next
					<c:if test="${searchResults.page != searchResults.lastPage}">
					</a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</c:if>