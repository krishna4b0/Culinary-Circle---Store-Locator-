<%--

  Recipe Box Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.recipes.RecipeBox"%><%
	RecipeBox recipebox = new RecipeBox(pageContext);
	pageContext.setAttribute("recipebox", recipebox);
%>
<div id="content-primary" role="Main " xmlns="">
	
	<div id="my-recipe-box">required *</div>
	<div class="container tabbed">
		<div class="container-top">&nbsp;</div>
		<h1><span>My Recipe Box</span></h1>
		<div class="container-inner clearfix">
			<c:choose>
				<c:when test="${recipebox.totalCount == 0 }">
					No saved recipes.
				</c:when>
				<c:otherwise>
					<div class="my-recipe-box-col1">

						<img width="70px" height="70px" alt=""
							src="/etc/designs/svubanners/master/images/GenericRecipeIcon.png">
						<h2>Last Saved Recipe</h2>
						<h3>${recipebox.recipe.name}</h3>
					</div>
					<div class="my-recipe-box-col2">
						<div class="rating"><!-- Need to find out how to get the rating. -->Not rated yet.</div>
						<p class="my-recipe-count">
							<span class="num">${recipebox.totalCount}</span> 
							<span class="label">Saved Recipes</span>
						</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	
	<div id="my-recipe-filter" class="container">
		<div id="error-message-container" class="displaynone" aria-live="assertive" role="alert"></div>
		<div class="container-top">&nbsp;</div>
		<div class="container-inner clearfix">
			<form action="${currentPage.path }.html" method="GET">
			<h2>Filter My Recipe Search by:</h2>
			<fieldset>
				<div class="filter-col">
					<label for="filter-main-ingredient">Main Ingredient</label>
					<select id="filter-main-ingredient" name="category['Main Ingredient']" aria-required="true">
						<option value="" title="All">All</option>
						<c:if test="${not empty recipebox.categories}" >
							<c:forEach var="category" items="${recipebox.categories}">
								<option value="${category}" title="${category}" <c:if test="${recipebox.selectedCategory==category }">selected="selected"</c:if>>${category}</option>
							</c:forEach>	
						</c:if>
					</select>
				</div>					
				<div class="filter-col">
					<label for="filter-dish">Dish</label>
					<select id="filter-dish" name="category['Dish']" aria-required="true">
						<option value="" title="All">All</option>
						<c:if test="${not empty recipebox.categories}" >
							<c:forEach var="subcategory" items="${recipebox.subcategories}">
								<option value="${subcategory}" title="${subcategory}" <c:if test="${recipebox.selectedSubCategory==subcategory }">selected="selected"</c:if>>${subcategory}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
				<div class="filter-col-submit">
					<input value="Search" type="submit" class="button">
				</div>
			</form>
		</div>	
	</div>

	
	<c:choose>
		<c:when test="${not empty recipebox.recipeList}">
			<ul id="my-filter-results-info">
				<li class="results-count">Results ${recipebox.fromIndex + 1 } to ${recipebox.toIndex } of ${recipebox.totalCount }</li>
				<c:choose>
					<c:when test="${recipebox.pageMax == 25 }">
						<li>Show <a href="${currentPage.path }.html?displayCount=10&category=${recipebox.category }&subcategory=${recipebox.subcategory }&sortProperty=${recipebox.sortProperty }&sortDirection=${recipebox.sortDirection }">10</a></li>
						<li>25</li>
						<li class="last"><a href="${recipebox.page.path}.html?displayCount=50&category=${recipebox.category }&subcategory=${recipebox.subcategory }&sortProperty=${recipebox.sortProperty }&sortDirection=${recipebox.sortDirection }">50</a></li>
					</c:when>
					<c:when test="${recipebox.pageMax == 50 }">
						<li>Show <a href="${currentPage.path }.html?displayCount=10&category=${recipebox.category }&subcategory=${recipebox.subcategory }&sortProperty=${recipebox.sortProperty }&sortDirection=${recipebox.sortDirection }">10</a></li>
						<li><a href="${currentPage.path }.html?displayCount=25&category=${recipebox.category }&subcategory=${recipebox.subcategory }&sortProperty=${recipebox.sortProperty }&sortDirection=${recipebox.sortDirection }">25</a></li>
						<li class="last">50</li>
					</c:when>
					<c:otherwise>
						<li>Show 10</li>
						<li><a href="${currentPage.path }.html?displayCount=25&category=${recipebox.category }&subcategory=${recipebox.subcategory }&sortProperty=${recipebox.sortProperty }&sortDirection=${recipebox.sortDirection }">25</a></li>
						<li class="last"><a href="${currentPage.path }.html?displayCount=50&category=${recipebox.category }&subcategory=${recipebox.subcategory }&sortProperty=${recipebox.sortProperty }&sortDirection=${recipebox.sortDirection }">50</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			
			
								
			<ul id="recipe-sort-bar">
				<li class=" first">
					<a href="${recipebox.sortAction }&sortDirection=${recipebox.newSortDirection}&sortProperty=name">Title</a>
				</li>
				<li class="">
					<a href="${recipebox.sortAction }&sortDirection=${recipebox.newSortDirection}&sortProperty=totalTime">Ready In</a>
				</li>
			</ul>
			<div>
				<table id="my-recipe-filter-results" cellspacing="0" cellpadding="4">
					<tbody>
					<!-- ### Begin recipes loop ### -->
						<c:forEach var ="recipe" items="${recipebox.recipeList}" varStatus="recipeStatus">
						<tr>
							<td rowspan="1" style=" width: 86px;">
								<c:set var="imgsource" value="\etc\designs\svubanners\master\images\GenericRecipeIcon.png" />
								<c:if test="${not empty recipe.media[0].url }">
									<c:set var="imgsource" value="${recipe.media[0].url }" />
								</c:if>
								
								<div class="recipe-image">
									<a href="${recipebox.recipeTemplatePath }.${recipe.recipeId}.html<c:if test="${recipe.source == 'CustomRecipe' }">?source=CustomRecipe</c:if>">
										<img width="70px" height="70px" src="${imgsource }">
									</a>
								</div>
							</td>
							<td width="200px">
								<div class="recipe-name">
									<h4>
										<a href="${recipebox.recipeTemplatePath }.${recipe.recipeId}.html<c:if test="${recipe.source == 'CustomRecipe' }">?source=CustomRecipe</c:if>">${recipe.name}</a>
									</h4>
								</div>
							</td>
							<td style=" width: 176px;">
								<div class="recipe-prep-time">${recipe.totalTime}</div>
							</td>
							<td style=" width: 81px;">
								<div class="recipe-controls">
									<a class="delete-recipe" href="/services/recipebox.html?recipeId=${recipe.recipeId}&action=remove&recipeSource=${recipe.source }">
										<img alt="Delete this recipe" src="\etc\designs\svubanners\master\images\icn-delete.png">
									</a>
								</div>
							</td>
						</tr>
							
						<tr>
							<td class="toggle-row" colspan="4">
								<a class="toggle-ingredients-${recipeStatus.index} toggle" href="#">Hide Ingredients</a>
							</td>
						</tr>
							
						<tr>
							<td class="ingredients-container" colspan="4">
								<div class="my-recipe-filter-results-details-${recipeStatus.index} ingredient-tile clearfix">
									<form action="/services/shoppinglist.activelist.html" method="post">
										<fieldset>
										  	<c:if test="${not empty recipe.ingredients}">				  
												<ul class="ingredient-list">
												<c:forEach var="ingredient" items="${recipe.ingredients}" varStatus="ingredientStatus">
													<c:if test="${not empty ingredient.quantity}"><c:set var="ingredientQuantity" value="${ingredient.quantity}"/></c:if> 
                                                       <c:if test="${empty ingredient.quantity}"><c:set var="ingredientQuantity" value=""/></c:if> 
                                                       <li>																	
														<input id="recipe${recipeStatus.index}-ingredient${ingredientStatus.index}" class="ingredientCB" type="checkbox" name="selections" value="${ingredientStatus.index}">
														<label for="recipe${recipeStatus.index}-ingredient${ingredientStatus.index}">${ingredientQuantity} ${ingredient.name}</label>
														<input type="hidden" name="itemTxt" value="${ingredientQuantity} ${ingredient.name}" />
														<input value="${ingredient.quantity}" type="hidden" name="itemQtyTxt">
						                    			<input value="${recipe.source }" type="hidden" name="itemSource">
						                    			<input value="${fn:escapeXml(recipe.name)}" type="hidden" name="itemAdditionalInfo">
						                    			<input value="${recipe.recipeId}" type="hidden" name="itemId">
						                    			<c:choose>
															<c:when test="${recipe.source == 'CustomRecipe' }">
							                    				<input value="MYRECIPE" type="hidden" name="itemType">
							                    			</c:when>
							                    			<c:otherwise>
							                    				<input value="RECIPE" type="hidden" name="itemType">
							                    			</c:otherwise>
						                    			</c:choose>
													</li>
												</c:forEach>							
												</ul>											
											</c:if>													
											<a class="select-all-ingredients check-all" href="#">Select All</a>
											<div class="ingredient-controls">
												<input type="hidden" name="forceSelections" value="true" />
												<input type="hidden" name="action" value="addItems" />
												<input type="hidden" name="resource" value="${currentPage.path }.html" />
												<input class="button add-all-button" type="submit" value="Add Ingredients to Shopping List" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'recipebox', 'Add Ingredients to Shopping List']);" >
											</div>
										</fieldset>
									</form>
								</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="pagination">
				<ul>
					<li class="previous"><c:if test="${recipebox.pageNumber > 1}"><a href="${recipebox.page.path}.html?displayCount=${recipebox.pageMax}&currentPageNumber=${recipebox.pageNumber - 1}"></c:if>Previous<c:if test="${recipebox.pageNumber > 1}"></a></c:if></li>
					<li class="pages">Page:
						<ol>
							<c:forEach var="pageIndex" items="${recipebox.pagesToShow}">
								<c:if test="${((recipebox.pageNumber + 3) < recipebox.totalPages) && (pageIndex == recipebox.totalPages) && (pageIndex != recipebox.pageNumber)}" >
									<li>...</li>
								</c:if>
								<c:choose>
									<c:when test="${pageIndex == recipebox.pageNumber}">
										<li class="current-page">
									</c:when>
									<c:otherwise>
										<li>
									</c:otherwise>
								</c:choose>
								<c:if test="${pageIndex != recipebox.pageNumber}"><a href="${recipebox.page.path}.html?displayCount=${recipebox.pageMax}&currentPageNumber=${pageIndex}"></c:if>${pageIndex}<c:if test="${pageIndex != recipebox.pageNumber}"></a></c:if></li>
		
		
								<c:if test="${((recipebox.pageNumber - 3) > 1) && (pageIndex == 1)}" >
									<li>...</li>
								</c:if>
							</c:forEach>
						</ol>
					</li>
					<li class="next"><c:if test="${recipebox.pageNumber != recipebox.totalPages}"><a href="${recipebox.page.path}.html?displayCount=${recipebox.pageMax}&currentPageNumber=${recipebox.pageNumber + 1}"></c:if>Next<c:if test="${recipebox.pageNumber != recipebox.totalPages}"></a></c:if></li>
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<p>Sorry, No recipes found</p>
			</div>
		</c:otherwise>
	</c:choose>
</div>