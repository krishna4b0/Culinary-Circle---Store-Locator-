<%--

  add to list component.

  

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.AddToList"%><%
AddToList addToList = new AddToList(pageContext);
pageContext.setAttribute("addToList", addToList);

%>
<div>
    <p>
    	<c:if test="${addToList.style!='button'}">${addToList.itemName}</c:if>
        <a id="add-item-link-${addToList.itemId }" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'addtolist', 'Add to List']);" href="/services/shoppinglist.activelist.html?itemTxt=${addToList.itemName}&amp;itemQtyTxt=1&amp;itemType=ENTERED&amp;itemSource=addToList&amp;action=addItems" class="${addToList.style}">Add to List</a>
    </p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#add-item-link-${addToList.itemId }').click(function(evt){
		evt.preventDefault();
		
		if(typeof _gaq !== 'undefined'){
			//_gaq.push(['_trackEvent', '${currentPage.title }', 'AddToList', '${addToList.itemName}']);
		}
		
		$.ajax({
			  type: 'POST',
			  cache: false,
			  url: '/services/shoppinglist.activelist.json',
			  data: {
				 'itemTxt': encodeURI('${addToList.itemName }'),
				 'itemQtyTxt': 1,
				 'itemType': 'ENTERED',
				 'itemSource': 'addToList',
				 'itemId': '',
				 'expirationDate': '',
				 'action': 'addItems'
			  },
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