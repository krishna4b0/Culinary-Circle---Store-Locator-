<%--

  News Article List component.

  News Article List

--%><%@ page import="com.svu.bannersites.cq5.components.news.ArticleListComponent"%><%
%><%@include file="/apps/svubanners/global.jsp"%><%

	ArticleListComponent articleList = new ArticleListComponent(pageContext);
	pageContext.setAttribute("articleList", articleList);
%>
<c:choose>
	<c:when test="${empty articleList.pages && articleList.authorMode}">
		<cq:include script="empty.jsp"/>
	</c:when>
	<c:otherwise>
		<ul id="my-filter-results-info">
			<li class="results-count">Results ${articleList.fromIndex + 1 } to ${articleList.toIndex } of ${articleList.totalCount }</li>
			<c:choose>
				<c:when test="${articleList.pageMax == 25 }">
					<li>Show <a href="${articleList.page.path}.html?displayCount=10">10</a></li>
					<li>25</li>
					<li class="last"><a href="${articleList.page.path}.html?displayCount=50">50</a></li>
				</c:when>
				<c:when test="${articleList.pageMax == 50 }">
					<li>Show <a href="${articleList.page.path}.html?displayCount=10">10</a></li>
					<li><a href="${articleList.page.path}.html?displayCount=25">25</a></li>
					<li class="last">50</li>
				</c:when>
				<c:otherwise>
					<li>Show 10</li>
					<li><a href="${articleList.page.path}.html?displayCount=25">25</a></li>
					<li class="last"><a href="${articleList.page.path}.html?displayCount=50">50</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<ul id="sort-bar"><li class="selected first"></li></ul>
		<ul class="news-listings">
			<c:forEach var="articlePage" items="${articleList.pages}" varStatus="status">
				
				<li<c:if test="${status.count % 2 == 0 }">class="odd"</c:if>>
					<span class="date"><fmt:formatDate value="${articlePage.lastModified.time}" pattern="MM/dd/yyyy hh:mm:ss" /></span>
					<h4 class="title">
						<a href="${articlePage.path}.html">
							<c:choose>
								<c:when test="${not empty articlePage.properties['headline']}">
									${articlePage.properties['headline']}
								</c:when>
								<c:when test="${not empty articlePage.pageTitle}">
									${articlePage.pageTitle}
								</c:when>
								<c:otherwise>
									${articlePage.title}
								</c:otherwise>
							</c:choose>
						</a>
					</h4>
				</li>
			</c:forEach>
		</ul>
		<div class="pagination">
			<ul>
				<li class="previous"><c:if test="${articleList.pageNumber > 1}"><a href="${articleList.page.path}.html?displayCount=${articleList.pageMax}&currentPageNumber=${articleList.pageNumber - 1}"></c:if>Previous<c:if test="${articleList.pageNumber > 1}"></a></c:if></li>
				<li class="pages">Page:
					<ol>
						<c:forEach var="pageIndex" items="${articleList.pagesToShow}">
							<c:if test="${((articleList.pageNumber + 3) < articleList.totalPages) && (pageIndex == articleList.totalPages) && (pageIndex != articleList.pageNumber)}" >
								<li>...</li>
							</c:if>
							<c:choose>
								<c:when test="${pageIndex == articleList.pageNumber}">
									<li class="current-page">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<c:if test="${pageIndex != articleList.pageNumber}"><a href="${articleList.page.path}.html?displayCount=${articleList.pageMax}&currentPageNumber=${pageIndex}"></c:if>${pageIndex}<c:if test="${pageIndex != articleList.pageNumber}"></a></c:if></li>


							<c:if test="${((articleList.pageNumber - 3) > 1) && (pageIndex == 1)}" >
								<li>...</li>
							</c:if>
						</c:forEach>
					</ol>
				</li>
				<li class="next"><c:if test="${articleList.pageNumber != articleList.totalPages}"><a href="${articleList.page.path}.html?displayCount=${articleList.pageMax}&currentPageNumber=${articleList.pageNumber + 1}"></c:if>Next<c:if test="${articleList.pageNumber != articleList.totalPages}"></a></c:if></li>
			</ul>
		</div>
	</c:otherwise>
</c:choose>