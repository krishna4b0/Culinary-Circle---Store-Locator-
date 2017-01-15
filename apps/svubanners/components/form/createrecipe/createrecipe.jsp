<%--

  My Recipe Form Component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.MyRecipeForm"%><%
    MyRecipeForm myRecipeForm = new MyRecipeForm(pageContext);
    pageContext.setAttribute("myRecipeForm", myRecipeForm);
%>
    <div class="container tabbed">
        <div class="container-top">&nbsp;</div>
        <h1><span>Add Your Own Recipe</span></h1>
        <div class="container-inner typical">
            <div aria-live="assertive" id="error-message-container" class="displaynone" role="alert">
            	<c:if test="${not empty myRecipeForm.errors }">
            	<h4>Please correct the following:</h4>
            	<c:forEach var="error" items="${myRecipeForm.errors }">
            	<li>${error }</li>
            	</c:forEach>
            	</c:if>
            </div>
            <div class="col-1">
                <div class="recipe-image">
                    <a href="viewrecipe.action?recipeId=">
                        <img alt="" height="120px" src="/etc/designs/svubanners/master/images/GenericRecipeIcon.png" width="120px">
                    </a>
                    <p>READY IN :   MINUTES</p>
                </div>
            </div>
            <div class="required-info">required *</div>
            <div class="recipe-title">
                <h4><label for="recipe-title">Recipe Title<span class="required">*</span></label></h4>
                <input class="inp-text title" id="recipe-title" maxlength="40" aria-required="true" name="recipeTitle" title="Enter Recipe Title" type="text" value="" />
            </div>
            <table class="form">
                <thead>
                    <tr>
                        <th scope="col">Amount</th>
                        <th scope="col">Ingredient</th>
                    </tr>
                </thead>
                <tbody id="ingredient-space">
                    <tr>
                        <td scope="row">
                            <input class="inp-text amount" id="recipeIngredients[0].quantity" maxlength="20" name="recipeIngredients[0].quantity" title="Enter Ingredient Amount" type="text" value="" />
                        </td>
                        <td>
                            <input class="inp-text ingredient" id="recipeIngredients[0].name" maxlength="40" name="recipeIngredients[0].name" title="Enter Ingredient Name" type="text" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <input class="inp-text amount" id="recipeIngredients[1].quantity" maxlength="20" name="recipeIngredients[1].quantity" title="Enter Ingredient Amount" type="text" value="" />
                        </td>
                        <td>
                            <input class="inp-text ingredient" id="recipeIngredients[1].name" maxlength="40" name="recipeIngredients[1].name" title="Enter Ingredient Name" type="text" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <input class="inp-text amount" id="recipeIngredients[2].quantity" maxlength="20" name="recipeIngredients[2].quantity" title="Enter Ingredient Amount" type="text" value="" />
                        </td>
                        <td>
                            <input class="inp-text ingredient" id="recipeIngredients[2].name" maxlength="40" name="recipeIngredients[2].name" title="Enter Ingredient Name" type="text" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <input class="inp-text amount" id="recipeIngredients[3].quantity" maxlength="20" name="recipeIngredients[3].quantity" title="Enter Ingredient Amount" type="text" value="" />
                        </td>
                        <td>
                            <input class="inp-text ingredient" id="recipeIngredients[3].name" maxlength="40" name="recipeIngredients[3].name" title="Enter Ingredient Name" type="text" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <input class="inp-text amount" id="recipeIngredients[4].quantity" maxlength="20" name="recipeIngredients[4].quantity" title="Enter Ingredient Amount" type="text" value="" />
                        </td>
                        <td>
                            <input class="inp-text ingredient" id="recipeIngredients[4].name" maxlength="40" name="recipeIngredients[4].name" title="Enter Ingredient Name" type="text" value="" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <p>
                <a id="add-rows-1" class="add-rows add" href="javascript:submitForm('1');">Add 1 More Ingredient</a> 
                <a id="add-rows-5" class="add-rows" href="javascript:submitForm('5');">Add 5 More</a>
            </p>
            <h4><label for="notes">Notes &amp; Directions</label></h4>
            <p><textarea class="inp-textarea notes" id="notes" maxlength="2000" name="instructions"></textarea></p>
            <div id="tray-1">
                <div class="clearfix">
                    <div id="create-recipe-serves">
                        <label for="serves">Serves</label><br></br>
                        <select id="serves" name="numberServings">
                            <option value="">All</option>
                            <option value="1" >1</option>
                            <option value="2" >2</option>
                            <option value="4" >4</option>
                            <option value="6" >6</option>
                            <option value="10" >10</option>
                        </select>               
                    </div>
                    <div class="left">
                        <label for="preptime">Prep time</label><br></br>
                        <select id="preptime" name="prepTime" onchange="javascript:calculateTotalTime()">
                            <option value="">All</option>
                            <option value="1" >1</option>
                            <option value="5" >5</option>
                            <option value="10" >10</option>
                            <option value="30" >30</option>
                            <option value="45" >45</option>
                            <option value="60" >60</option>
                        </select>                                           
                        &nbsp;<strong>+</strong>&nbsp;
                    </div>
                    <div class="left">
                        <label for="cooktime">Cook time</label><br></br>
                        <select id="cooktime" name="cookTime" onchange="javascript:calculateTotalTime()">
                            <option value="">All</option>
                            <option value="1" >1</option>
                            <option value="5" >5</option>
                            <option value="10" >10</option>
                            <option value="30" >30</option>
                            <option value="45" >45</option>
                            <option value="60" >60</option>
                        </select>                                               
                        &nbsp;<strong>=</strong>&nbsp;
                    </div>
                    <div class="left">
                        <label for="readyin">Ready in</label><br></br>
                        <input class="inp-text" id="readyin" maxlength="4" name="totalTime" type="text" value="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${not empty myRecipeForm.categories}" >
        <div class="clearfix" id="tray-2">
            <c:forEach var="category" items="${myRecipeForm.categories}" varStatus="status">
                <div class="cat-subcat">
                    <h4>${category.categoryDisplayName}</h4>
                    <p>
                        <c:if test="${not empty category.subcategories}" >
                            <c:forEach var="subcategory" items="${category.subcategories}" >
                                <input class="radio-check" name="subcategory" type="checkbox" value="${category.categoryDisplayName},${subcategory}" /><label for="">${subcategory}</label><br>
                            </c:forEach>
                        </c:if>
                    </p>
                </div>
            </c:forEach>
            <div class="clearall"></div>
        </div>
        <div class="clearall"></div>
    </c:if>
    <div class="clearfix">
        <div class="left">
            <input class="button" type="submit" value="Save" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'createrecipe', 'Save']);" />
            <input value="${myRecipeForm.recipe.recipeId }" name="recipeId" type="hidden" />
        </div>
        <div class="right">
            <a href="${myRecipeForm.returnPage }">Cancel</a>
        </div>
    </div>
