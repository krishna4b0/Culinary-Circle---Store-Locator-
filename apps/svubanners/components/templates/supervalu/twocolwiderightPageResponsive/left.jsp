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

  Three-Column Left Content Script

  Builds the left content area for a page.

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.ShoppingListWidget"%><%
	ShoppingListWidget shoppingListWidget = new ShoppingListWidget(pageContext);
	pageContext.setAttribute("shoppingListWidget", shoppingListWidget);
%>

<div class="content-sidebar">
    <cq:include path="contextualnav" resourceType="svubanners/components/responsive/navigation/contextualnavigation" />

<!--shopping list-->
<div class="shopping-list-container" data-shoppinglisturl="${shoppingListWidget.viewListsPage }.html">
<c:if test="${shoppingListWidget.authorMode && suppressShoppingList }">
	<p class="title main">Shopping List is disabled for this site</p>
</c:if>
<c:if test="${not suppressShoppingList }">

    	<h4 class="shopping-list-title">My Shopping List</h4>

        <div class="shopping-list-content-empty widget-shopping-list">
            <img src="/etc/designs/svubanners/master/img/hero-shopping-list-widget.jpg" alt="" title="">
            <h4 class="empty-shopping-cart-title">${shoppingListWidget.emptyHeadline }Your shopping list is empty!</h4>

            <a class="create-a-list" href="${shoppingListWidget.viewListsPage }.html">Create a List</a>

	    	<p>It's easy to use -- just click on anything that says "Add to List" or enter your own items today!</p>
	  	</div>

    <script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url: '/services/shoppinglist.activelist.json',
			cache: false,
			dataType: 'json',
			success: function(data){
				refreshShoppingListWidget(data,true);	
			},
			error: function(jqXHR, textStatus, errorThrown) {
		  		//  alert("Sorry, An error has occurred while initializing your shopping list.");	
			}
		});
	});
	</script>
</c:if>
</div>


</div>