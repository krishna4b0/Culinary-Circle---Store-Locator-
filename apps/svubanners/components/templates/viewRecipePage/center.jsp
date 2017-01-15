<%--
  Copyright 1997-2010 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Three-Column Center Content Script

  Builds the main content area for a page.

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false"%>
<div id="content-primary">
    <div class="recipe-detail-col1">
        <div class="recipe-detail-title">
            <h1 itemprop="name">${template.recipe.name}
            <c:if test="${not empty template.recipe.subTitle}">
                <br/><span>${template.recipe.subTitle}</span>
            </c:if>
            </h1>
            <c:if test="${not empty template.recipe.description}">
                <h2 itemprop="description">${template.recipe.description}</h2>
            </c:if>
            <div class="recipe-detail-meta-info">
                <c:if test="${template.recipe.cookTime != 0 }">
                    <p>Active Time: ${template.recipe.cookTime}</p>
                </c:if>
                <c:if test="${template.recipe.totalTime != 0 }">
                    <p>Total Time: ${template.recipe.totalTime}</p>
                </c:if>
                <p class="servings" itemprop="recipeYield">Serves: ${template.recipe.servings } </p>
            </div>
        </div>
        <c:if test="${not empty template.recipe.ingredients}">
            <form id="frm-recipe-list-detail" method="post" action="/services/shoppinglist.activelist.html" >
                <div class="ingredients">
                    <h2>INGREDIENTS</h2>
                    <div class="ingredient-listing">
                        <ul id="ingredients">              
                            <c:forEach var="ingredient" items="${template.recipe.ingredients}" varStatus="status">
                                <li itemprop="ingredients">
                                    <p></p>
                                    <p>
                                    	<c:if test="${not suppressShoppingList }">
                                        	<input type="checkbox" name="selections" value="${status.index}" id="ingredient-listing-${status.index }"/>
                                        </c:if>
                                        <input type="hidden" name="itemTxt" value="${fn:escapeXml(ingredient.shoppingListName)}" />
                                        <label>${ingredient.quantity} <c:if test="${not empty(ingredient.unitSize) }">(${ingredient.unitSize})</c:if></label>
                                        <label>${ingredient.unitOfMeasure}</label>
                                        <c:if test="${not empty(ingredient.preMod) }"><label>${ingredient.preMod}</label></c:if>
                                        <label for="ingredient-listing-${status.index }">${ingredient.name}
                                        <c:if test="${not empty(ingredient.postMod) }">, ${ingredient.postMod}</c:if></label>
                                        <input value="${ingredient.quantity}" type="hidden" name="itemQtyTxt">
                                        <input value="ThirdPartyRecipe" type="hidden" name="itemSource">
                                        <input value="${fn:escapeXml(template.recipe.name)}" type="hidden" name="itemAdditionalInfo">
                                        <input value="${template.recipe.recipeId}" type="hidden" name="itemId">
                                        <c:choose>
                                            <c:when test="${template.source == 'CustomRecipe' }">
                                                <input value="MYRECIPE" type="hidden" name="itemType">
                                            </c:when>
                                            <c:otherwise>
                                                <input value="RECIPE" type="hidden" name="itemType">
                                            </c:otherwise>
                                        </c:choose>
                                        
                                    </p>                                
                                </li>
                            </c:forEach>
                         <%--End ingredients list --%>
                        </ul>
                        <div role="navigation">
                            <ul class="check-all select-add hideprint">
                                <li id="left">
                                    <a id="select-all" href="#">SELECT ALL</a>
                                </li>
                                <li id="right">
                                <input id="add-all-button" type="submit" value="ADD TO LIST" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'viewRecipePage', 'ADD TO LIST']);">
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <input type="hidden" name="forceSelections" value="true">
                <input type="hidden" name="action" value="addItems">
                <input type="hidden" name="resource" value="${currentPage.path }.${template.recipe.recipeId}.html">
            </form>
        </c:if>
    </div>
    
    <div class="recipe-detail-col2">
        <c:if test="${not empty template.recipe.media[0].url}">
            <div class="image">
                <img alt="${template.recipe.name}" src="/content/dam/B2C/enterprisebannerwebsites/common/img/recipe/recipeimages/${template.recipe.media[0].url}.jpg">
            </div>
        </c:if>
        <c:if test="${not empty template.recipe.instructions}">
            <h2>DIRECTIONS</h2>
            <ul id="instructions" itemprop="recipeInstructions">
                <c:forEach var="direction" items="${template.recipe.instructions}">
                    <li>
                        <span>${direction.instruction}</span>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${not empty template.recipe.recipeNote}">
            <p class="note">${template.recipe.recipeNote}</p>
        </c:if>
        <c:if test="${not empty template.recipe.recipeNutritions}">
            <h2 class="nutrition">NUTRITIONAL INFORMATION</h2>
            
            <c:if test="${not empty template.recipe.nutritionStatement}">
                <h4>${template.recipe.nutritionStatement}</h4>
            </c:if>
            
            <c:if test="${not empty template.recipe.servingSize }">
            	Serving Size: ${template.recipe.servingSize }<br/>
            </c:if>
            
            <ul id="nutrition">
                <c:forEach var="nutrition" items="${template.recipe.recipeNutritions}">
                    <li>
                        <span>${nutrition.description} ${nutrition.amount}${nutrition.uom}</span>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${not empty template.recipe.copyright}">
            <p class="copyright">${template.recipe.copyright}</p>
        </c:if>
        <c:if test="${not empty template.recipe.brandLogoUrl}">
            <img class="brand-logo" src="${template.recipe.brandLogoUrl}" alt=""/>
        </c:if>
    </div>   
    <cq:include path="buttonrow" resourceType="svubanners/components/general/buttonrow" />
</div>
<script type="text/javascript">
$(document).ready(function(){
    $('#ingredients li').mouseenter(function(){
        $(this).addClass('hover');
    }).mouseleave(function() {
        $(this).removeClass('hover');
    });
    
    $('#select-all').click(function (evt) {
        evt.preventDefault();
        $(this).closest("form").find("input:checkbox").each(function() {
            this.checked = true;
            this.setAttribute("checked", true);
        });
        return false;
    });
    
    $('#add-all-button').click(function(evt){
        evt.preventDefault();
        
        if(typeof _gaq !== 'undefined'){
            var frmDataArray = $('#frm-recipe-list-detail').serializeObject();
            var selectedItems = frmDataArray.selections;
            var itemTxts = frmDataArray.itemTxt;
            for(var i=0;i<selectedItems.length;i++) {
                var selectionIndex = selectedItems[i];
                var selectedItemName = encodeURI(itemTxts[selectionIndex]);
                //_gaq.push(['_trackEvent', '${currentPage.title }', 'AddRecipeIngredientsToList', selectedItemName]);
            }
        }
        
        $.ajax({
              type: 'POST',
              cache: false,
              url: '/services/shoppinglist.activelist.json',
              data: encodeURI($('#frm-recipe-list-detail').serialize()),
              success: function(data){
                  refreshShoppingListWidget(data,false);
              },
              error: function(jqXHR, textStatus, errorThrown) {
                  alert("An error has occurred while trying to add this item to your shopping list, Please try again.");    
              },
              dataType: 'json'
        });
    });
});
</script>