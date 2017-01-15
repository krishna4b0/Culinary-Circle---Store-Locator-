<%--

  Recipe Search Results Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.RecipeSearchResults"%><%
	RecipeSearchResults recipeSearchResults = new RecipeSearchResults(pageContext);
	pageContext.setAttribute("recipeSearchResults", recipeSearchResults);
%>
<c:if test="${not empty recipeSearchResults.errorMessages }">
		<div id="error-message-container" style="display: block;">
			<h4>Please correct the following:</h4>
			<ul>
				<c:forEach var="message" items="${recipeSearchResults.errorMessages }">
					<li>${fn:escapeXml(message) }</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
<c:choose>
	<c:when test="${empty recipeSearchResults.recipes}">
		<div>
			<h2 id="search-term-display">${fn:escapeXml(recipeSearchResults.keyword) } (0 results)</h2>
			No Recipes found.
		</div>
	</c:when>
	<c:otherwise>
		<div>


			<h2 id="search-term-display">
				<c:if test="${not empty recipeSearchResults.keyword }">
                "${fn:escapeXml(recipeSearchResults.keyword) }" &nbsp;
                </c:if>
                    (${recipeSearchResults.totalCount} results)</h2>

			<table id="my-recipe-filter-results" class="browse" cellspacing="0" cellpadding="4">
			<thead>
				    <tr id="recipe-sort-bar">
				        <th colspan="2" class="selected first">
                        <span id="title-sort-description" class="visually-hidden">Click to sort by title</span>
				            <strong><a href="${recipeSearchResults.sortLink}&sortDirection=<%=recipeSearchResults.getNewSortDirection("name") %>&sortProperty=name" aria-describedby="title-sort-description">Title</a></strong>
                        </th>
				        <th class="">
				        <span id="ready-sort-description" class="visually-hidden">Click to sort by title</span>
				        <strong><a href="${recipeSearchResults.sortLink}&sortDirection=<%=recipeSearchResults.getNewSortDirection("totalTime") %>&sortProperty=totalTime" aria-describedby="ready-sort-description">Ready In</a></strong></th>
				    </tr>
				</thead>
				<!-- ### Begin Product Loop ### -->
				<tbody>
					
					<c:forEach var="recipe" items="${recipeSearchResults.recipes}" varStatus="i">
						<tr>
							<td>
								<c:set var="imgsource" value="/etc/designs/svubanners/master/images/GenericRecipeIcon.png" />
								<c:if test="${not empty recipe.media[0].url }">
									<c:set var="imgsource" value="/content/dam/B2C/enterprisebannerwebsites/common/img/recipe/recipeimages/${recipe.media[0].url}.jpg" />
								</c:if>
				
								<div class="recipe-image">
									<c:choose>
                                    <c:when test="${not empty recipe.brandCode}">
                                        <a href="${recipeSearchResults.viewRecipePath}.${recipe.recipeId}.${recipe.brandCode}.html">
                                         <img width="70" height="70" src="${imgsource }" alt="Image of ${recipe.name}">
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                    	<a href="${recipeSearchResults.viewRecipePath}.${recipe.recipeId}.NO_BRAND.html">
                                         <img width="70" height="70" src="${imgsource }" alt="Image of ${recipe.name}">
                                        </a>
                                    </c:otherwise>
                                </c:choose>

								</div>
							</td>
							
							<td>
								<div class="recipe-name">
								<c:choose>
									<c:when test="${not empty recipe.brandCode}">
										<a href="${recipeSearchResults.viewRecipePath}.${recipe.recipeId}.${recipe.brandCode}.html">${recipe.name}</a>
									</c:when>
									<c:otherwise>
									<a href="${recipeSearchResults.viewRecipePath}.${recipe.recipeId}.NO_BRAND.html">${recipe.name}</a>
									</c:otherwise>
								</c:choose>
								</div>
							</td>
							
							<td><div class="recipe-prep-time">${recipe.readyTime} </div></td>
							
							<td>
								<div class="recipe-controls">
									<div class="rating">
										<!-- Removed recipe box functionality
										<c:choose>
											<c:when test="${recipe.inRecipeBox }">
											In Recipe Box
											</c:when>
											<c:otherwise>
											<a onclick="//_gaq.push('Recipes', 'Add To Recipe Box (Listing)', '[${fn:escapeXml(recipe.name)}(${recipe.recipeId })]');" href="/services/recipebox.html?recipeId=${recipe.recipeId}&recipeSource=ThirdPartyRecipe">+ add to recipe box</a>
											</c:otherwise>
										</c:choose>
										-->
									</div>
								</div>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="pagination">
				<ul>
					<li class="previous"><c:if test="${recipeSearchResults.pageNumber > 1}"><a href="${recipeSearchResults.pageLink}&currentPageNumber=${fn:escapeXml(recipeSearchResults.pageNumber) - 1}"></c:if>Previous<c:if test="${recipeSearchResults.pageNumber > 1}"></a></c:if></li>
					<li class="pages">Page:
						<ol>
							<c:forEach var="pageIndex" items="${recipeSearchResults.pagesToShow}">
								<c:if test="${((recipeSearchResults.pageNumber + 3) < recipeSearchResults.totalPages) && (pageIndex == recipeSearchResults.totalPages) && (pageIndex != recipeSearchResults.pageNumber)}" >
									<li>...</li>
								</c:if>
								<c:choose>
									<c:when test="${pageIndex == recipeSearchResults.pageNumber}">
										<li class="current-page">
									</c:when>
									<c:otherwise>
										<li>
									</c:otherwise>
								</c:choose>
								<c:if test="${pageIndex != recipeSearchResults.pageNumber}"><a href="${recipeSearchResults.pageLink}&currentPageNumber=${pageIndex}"></c:if>${pageIndex}<c:if test="${pageIndex != recipeSearchResults.pageNumber}"></a></c:if></li>
								<c:if test="${((recipeSearchResults.pageNumber - 3) > 1) && (pageIndex == 1)}" >
									<li>...</li>
								</c:if>
							</c:forEach>
						</ol>
					</li>
					<li class="next"><c:if test="${recipeSearchResults.pageNumber != recipeSearchResults.totalPages}"><a href="${recipeSearchResults.pageLink}&currentPageNumber=${recipeSearchResults.pageNumber + 1}"></c:if>Next<c:if test="${recipeSearchResults.pageNumber != recipeSearchResults.totalPages}"></a></c:if></li>
				</ul>
			</div>
		</div>
	</c:otherwise>
</c:choose>