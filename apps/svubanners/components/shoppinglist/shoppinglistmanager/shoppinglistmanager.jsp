<%--

  Shopping List Manager component.

  Component to manage shopping lists

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.ShoppingListManager"%><%
	ShoppingListManager shoppingListManager = new ShoppingListManager(pageContext);
	pageContext.setAttribute("shoppingListManager", shoppingListManager);
%>	
<!-- Main component -->

<div id="content-primary">

<!-- Hero component -->
<cq:include path="hero" resourceType="svubanners/components/general/hero" />

<!-- Shopping list -->
	<!-- Header -->
	<div id="shoppinglist-full-header" class="typical">
		<h3>${ not empty shoppingListManager.shoplist.name ? fn:escapeXml(shoppingListManager.shoplist.name) : "My Shopping List"  }</h3>
    </div>
	<c:if test="${not empty shoppingListManager.errorMessages }">
		<div id="error-message-container" style="display: block;">
			<h4>Please correct the following:</h4>
			<ul>
				<c:forEach var="message" items="${shoppingListManager.errorMessages }">
					<li>${fn:escapeXml(message) }</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	
	
	<!-- Action to add the new item. AJAX  -->
	<div id="list-newitem" class="editing-listitem">
		<form action="/services/shoppinglist.activelist.html" method="post">
            <fieldset>
            <legend class="visually-hidden">Add Shopping List Item</legend>
			Add an item:
                <label for="custom-item-name" class="wai">Item Name</label>
			<input id="custom-item-name" style="color: #999;"
				onfocus="this.style.color = '#000'; if (this.value === this.defaultValue) this.value = ''; else this.select();"  
				type="text" name="itemTxt" class="sli-itemText" value="Item" maxlength="50">
                <label for="item-quantity" class="wai">Quantity</label>
			<input id="item-quantity" style="color: #999;"
				onfocus="this.style.color = '#000'; if (this.value === this.defaultValue) this.value = ''; else this.select();" 
				type="text" name="itemQtyTxt" class="sli-quantityText" value="Quantity" maxlength="20">
			<input type="hidden" value="addItems" name="action">
			<input type="hidden" value="ENTERED" name="itemType">
			<input type="submit" class="button" name="bottomButton" value="Add to list" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistmanager', 'Add to list']);">
			<input type="hidden" value="${currentPage.path }.html" name="resource" id="currentPage1" >
            </fieldset>
		</form>
	</div>
	
	<div id="related-commands_top" class="related-commands">
  		<form class="frm-clear-list" action="/services/shoppinglist.activelist.html" method="post">
	  		<input type="hidden" name="action" value="clearList">
	  		<input type="hidden" value="${currentPage.path }.html" name="resource">
	    	<button class="link" id="clear-list-top" name="clear" type="submit" value="Clear List" style="" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistmanager', 'Clear List']);">Clear List</button>
    	</form>
	</div>
	<form action="/services/shoppinglist.activelist.html" method="post" id="list-allitems">
	<table id="shoppinglist-full" class="enhanced" cellspacing="0" summary="Items currently in your shopping list">
		<thead class="fancyrow">
			<tr>
				<th class="startcap col_sli-cap">&nbsp;</th>
				<th class="col_sli-order">&nbsp;</th>
				<th class="divided col_sli-details" abbr="Item" scope="col">
					<!--button name="sort" type="submit" value="Item" class="heading" -->Item
				</th>
				<th class="col_sli-quantity "  abbr="Price" scope="col">
					 Price
				</th>
				<th class="col_sli-quantity " abbr="Quantity" scope="col">
					<!--button name="sort" type="submit" value="Qty" class="heading" --> Quantity
				</th>
				<th class="divided col_sli-modify">&nbsp;</th>
				<th class="stopcap col_sli-cap">&nbsp;</th>
			</tr>
			
			<!-- </form> -->
			<tr id="notification" class="notification">
				<td colspan="6">You may drag and drop items to rearrange them.</td>
			</tr>
		</thead>
		
		
		<tbody id="fullList">
			
				<c:if test="${not empty shoppingListManager.shoplist.items }">
				<c:forEach var="item" items="${shoppingListManager.shoplist.items }" varStatus="status">
				<c:choose>
					<c:when test="${item.itemType == 'RECIPE' }">
						<c:set var="sliType" value="sli-type_thirdpartyrecipe" />
					</c:when>
					<c:when test="${item.itemType == 'MYRECIPE' }">
						<c:set var="sliType" value="sli-type_customrecipe" />
					</c:when>
					<c:when test="${item.itemType == 'AD' }">
						<c:set var="sliType" value="sli-type_onsale" />
					</c:when>
					<c:when test="${item.itemType == 'COUPON' }">
						<c:set var="sliType" value="sli-type_coupon" />
					</c:when>
					<c:when test="${item.itemType == 'ECOUPON' }">
						<c:choose>
							<c:when test="${shoppingListManager.rewardsCardUser }">
								<c:set var="sliType" value="sli-type_ecouponRewards" />
							</c:when>
							<c:otherwise>
								<c:set var="sliType" value="sli-type_ecouponLoyalty" />
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${item.itemType == 'PRODUCT' }">
						<c:set var="sliType" value="sli-type_user" />
					</c:when>
					<c:when test="${item.itemType == 'ENTERED' }">
						<c:set var="sliType" value="sli-type_user" />
					</c:when>
					<c:otherwise>
						<c:set var="sliType" value="sli-type_user" />
					</c:otherwise>
				</c:choose>
				<tr class="sli ${sliType }" id="sli-line_${item.lineNumber }">
					<td class="col_sli-cap">&nbsp;</td>
					<td class="col_sli-order">
						<label id="listitem-displayOrder_${item.lineNumber }" class="wai">${item.displayOrder }</label>
					</td>
					<td class="col_sli-details">
						<c:choose>
							<c:when test="${shoppingListManager.editItemId == item.lineNumber}">
								<input value='<c:out value="${item.text }"/>' maxlength="50" type="text" id="listitem-itemText_${status.index }" name="itemTxt" maxlength="50" class="sli-itemText" >
							</c:when>
							<c:otherwise>
								<label id="listitem-itemText_${status.index }"><c:out value="${item.text }"/></label>
							</c:otherwise>
						</c:choose>
						<p class="mute">
						<c:choose>
							<c:when test="${item.itemType == 'RECIPE' }">
							For Recipe: <a href="${shoppingListManager.recipePage }.${item.externalId }.html">${item.additionalInfo }</a>
							</c:when>
							<c:when test="${item.itemType == 'MYRECIPE' }">
							For Recipe: <a href="${shoppingListManager.recipePage }.${item.externalId }.html?source=CustomRecipe">${item.additionalInfo }</a>
							</c:when>
							<c:when test="${item.itemType == 'AD' }">
							${item.additionalInfo }
							</c:when>
							<c:when test="${item.itemType == 'COUPON' }">
							${item.additionalInfo }
							</c:when>
							<c:when test="${item.itemType == 'ECOUPON' }">
							${item.additionalInfo }
							</c:when>
							<c:when test="${item.itemType == 'PRODUCT' }">
							${item.additionalInfo }
							</c:when>
						</c:choose>
						</p>
						<c:if test="${not empty item.expirationDate}">
						<p class="mute offer-exp-date">Expires - <fmt:formatDate pattern="MMM d, yyyy" value="${item.expirationDate }" /></p>
						</c:if>			
					</td>
					<c:choose>
						<c:when test="${shoppingListManager.editItemId == item.lineNumber}">
							<td class="col_sli-quantity">
								<input type="text" maxlength="20" name="quantityText" value='<c:out value="${item.quantityText }"/>' 
								        class="sli-quantityText" id="listitem-quantityText_${status.index }" >
								<input type="hidden" value="${item.lineNumber }" name="lineNumber" >
								<input type="hidden" value="editItem" name="action" >
								<input type="hidden" value="${item.displayOrder }" name="displayOrder" >
	                  		</td>
	                  		<td class="col_sli-modify">
		                		<button class="button sli-save" name="saveButton" type="submit" value="Save" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistmanager', 'Save']);">Save</button>
	                    		<a class="cancel-edit" href="${currentPage.path }.html" title="Cancel editing">Cancel</a>
	                  			<label id="listitem-listLineNumber_${status.index }" class="wai">${item.lineNumber }</label>
	              			</td>
						</c:when>
						<c:otherwise>
						<td class="col_sli-quantity">
							<label>${item.value }</label>
						</td>
						<td class="col_sli-quantity">
							<label id="listitem-quantityText_${status.index }"><c:out value="${item.quantityText }"/></label>

						</td>
						<td class="col_sli-modify">
							<a class="sli-edit" href="${currentPage.path }.html?editItemId=${item.lineNumber }" title="Edit this item">Edit</a> 
							<button class="btn-delete sli-delete" name="remove" type="submit" value="${item.lineNumber }" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistmanager', 'Delete item-'${item.lineNumber }]);"title="Delete this item" >${item.lineNumber }</button>
							<label id="listitem-listLineNumber_${status.index }" class="wai">${item.lineNumber }</label>
						</td>
						</c:otherwise>
					</c:choose>
					<td class="col_sli-cap">&nbsp;</td></tr>
				</c:forEach>
				</c:if>
				
			
		</tbody>
		<input type="hidden" value="${currentPage.path }.html" name="resource" id="currentPage2" >
		<input type="hidden" value="${shoppingListManager.recipePage }" name="resource" id="recipePage" >
		</form>
		
	</table>
	<div id="related-commands_bottom" class="related-commands">
  		<form class="frm-clear-list" action="/services/shoppinglist.activelist.html" method="post">
	  		<input type="hidden" name="action" value="clearList">
	  		<input type="hidden" value="${currentPage.path }.html" name="resource">
			<button class="link" id="clear-list-bottom" name="clear" type="submit" value="Clear List" style="" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistmanager', 'Clear List']);">Clear List</button>
		</form>
	</div>
</div>


<!-- Side toolbar component -->

<div id="content-related">
	<div class="widget-icon">
	<div class="widget-token">
		<img alt="Shopping list" src="/etc/designs/svubanners/master/images/token-shopping-list-red.png">
	</div>
	<h3>
		<span>Shopping List Tools</span>
	</h3>
	<div class="widget-icon-inner">
		<h4>Save Your List</h4>
		<c:choose>
			<c:when test="${not shoppingListManager.anonymous}">
				<div>
					<p>Save this list to use it later. You can save as many lists as you need.</p>
					<form action="get" id="frm_listname-widget" class="one-line" action="${currentPage.path}.html">
                        <fieldset>
						<p>
                            <label for="listName" class="wai">List Name</label>
							<input type="text" 
							name="listName" id="listName"
							value="${fn:escapeXml(shoppingListManager.shoplist.name) }">
							<input class="button" type="submit" name="saveButton" value="Save" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistmanager', 'Save']);">
						</p>
                        </fieldset>
					</form>
					<h4>My Recent Lists</h4>
					<div>
						<c:if test="${not empty shoppingListManager.shoppingLists}">
							<ul class="user-lists fancy">
								<c:set var="i" value="0" />
								<c:forEach var ="list" items="${shoppingListManager.shoppingLists}">
									<li>
										<a href="${currentPage.path}.html?listId=${list.id}">${fn:escapeXml(list.name)}</a>
										<a class="btn-delete" href="${shoppingListManager.allListsPath}.html?listId=${list.id}">Delete this list</a>
										<span><fmt:formatDate pattern="MM-dd-yyyy" value="${list.createDate }" /></span>
									</li>
									<c:set var="i" value="${i + 1}" />
								</c:forEach>
							</ul>
							<c:if test="${i > 5}">
								<p>You have more saved lists</p>
							</c:if>
							<p>
								<a href="${shoppingListManager.allListsPath}.html">View All Lists</a>
							</p>
						</c:if>
					</div>
					<form action="${currentPage.path}.html" method="GET">
						<input type="hidden" name="newList" value="true">
						<button class="link" type="submit" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistmanager', 'Create a new list']);">Create a new list</button>
					</form>
				</div>
				<div></div>
			</c:when>
			<c:otherwise>
				<div></div>
				<div>
					<p>You must create an account to save your lists.</p>
					<p>
						<a class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'shoppinglistmanager', 'Sign Up']);" href="${shoppingListManager.siteroot }/tools/signup.html">Sign Up</a>
						<a href="${shoppingListManager.siteroot }/tools/login.html" style=" margin-left: 10px;">Sign In</a>
					</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('form.frm-clear-list').submit(function(evt){
		evt.preventDefault();
		$.ajax({type: 'POST',
				  cache: false,
				  url: '/services/shoppinglist.activelist.json',
				  data: {
					  'action': 'clearList'
				  },
				  success: refreshShoppingListManager,
				  dataType: 'json'
		});
	});
	
	$('#shoppinglist-full').tableDnD({
	    dragHandle: 'col_sli-order',
	    onDrop: shoppingListDndOnDrop
	});
	
});
</script>