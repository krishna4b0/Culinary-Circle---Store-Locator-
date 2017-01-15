<%--
  Daily Deals product component
  
<%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.DailyDealsProduct"%><%
    DailyDealsProduct dailyDealsProduct = new DailyDealsProduct(pageContext);
    pageContext.setAttribute("dailyDealsProduct",dailyDealsProduct);
%>
--%>

<%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.DailyDealsProduct"%><%
    DailyDealsProduct dailyDealsProduct = new DailyDealsProduct(pageContext);
    pageContext.setAttribute("dailyDealsProduct",dailyDealsProduct);
%>

<c:if test="${dailyDealsProduct.shouldRender }" >

<div class="item-container">
  <div class="sale-item">
    <div class="sale-date">${dailyDealsProduct.dealdate}</div>
    <div class="item-image">
      <%-- <% dailyDealsProduct.getImage().draw(out); %>--%>
     
      <cq:include path="dailydealsimage" resourceType="foundation/components/image" />
    </div>
  </div>
  <div class="item-info">
    <div class="item-details">
      <p class="price">${dailyDealsProduct.productprice}</p>
      <p class="name">${dailyDealsProduct.productname}</p>
      <p class="details">${dailyDealsProduct.productdesc}</p>
     
	  <c:if test="${not suppressShoppingList}">
      	<a id="add-item-link-${fn:replace(dailyDealsProduct.productname, ' ', '') }" data-itemname="${dailyDealsProduct.productname}" class="button add-to-list" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'dailydealsproduct', '+ Add to List']);" href="/services/shoppinglist.activelist.html?itemTxt=${dailyDealsProduct.productname}&itemQtyTxt=1&itemType=ENTERED&itemSource=addToList&action=addItems&resource=${currentPage.path }.html">+ Add to List</a>
      </c:if>
    </div>
    <div class="item-recipe">
      <p>${dailyDealsProduct.recipeteaser}</p>
      <c:set var="cmbIndex" value="${dailyDealsProduct.recipelink}" />  
      
      <c:set var="cmbIndex2" value="${fn:split(cmbIndex, ',')}" />  
       

    <c:forEach var="item2" items="${dailyDealsProduct.recipeid}" varStatus="row">
    <c:set var="item2" value="${fn:trim(item2)}"/>
     <c:set var="link" value= "${item2}" />
     
    
  <p>  <a href = "/content/svubanners/albertsons/en/recipes/view-recipe.${item2}.html" /> 
     ${cmbIndex2[row.index]}</a> </p>
     </c:forEach>
     
    </div>
  </div>
  <div class="border">&nbsp;</div>
</div>


<script type="text/javascript">
$(document).ready(function(){
    $('#add-item-link-${fn:replace(dailyDealsProduct.productname, ' ', '') }').click(function(evt){
        evt.preventDefault();
        $.ajax({
              type: 'POST',
              cache: false,
              url: '/services/shoppinglist.activelist.json',
              data: {
                     'itemTxt': encodeURI($(this).attr('data-itemname')),
                     'itemQtyTxt': 1,
                     'itemType': 'ENTERED',
                     'itemSource': 'addToList',
                     'itemId': '',
                     'expirationDate': '',
                     'action': 'addItems'
                  },
              success: function(data){
                  refreshShoppingListWidget(data,false);
                  
                  var addedItem = $('#shopping-list-sidebar-items > tbody > tr').first();
				  glowElement(addedItem);
              },
              error: function(jqXHR, textStatus, errorThrown) {
                  alert("An error has occurred while trying to add this item to your shopping list, Please try again.");    
              },
              dataType: 'json'
        });
    });
});
</script>
</c:if>