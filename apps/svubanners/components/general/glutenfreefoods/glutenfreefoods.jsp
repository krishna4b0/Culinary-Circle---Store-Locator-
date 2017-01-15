<%--

  Hairline component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.GlutenFreeFoodFinder"%><%
	GlutenFreeFoodFinder glutenFree = new GlutenFreeFoodFinder(pageContext);
	pageContext.setAttribute("glutenFree",glutenFree);
%>
<h2 id="gf-finderHeader-2">gluten-free food finder</h2>
<h3 id="gf-finderInstructions">Click on an arrow below to see more options.*</h3>
<div id="gf-details-2" class="gf-details">
	<div id="gf-mainAccordion" class="gf-accordion">
		<c:forEach var="category" items="${glutenFree.products.catArray }">
		<h5><a href="#" class="header">${category.name }</a></h5>
		<ul class="gf-accordionLevel2">
			<c:forEach var="subCategory" items="${category.subcatArray }">
			<li>
				<a href="#">${subCategory.name }</a>
				<ul class="gf-accordionLevel3">
					<c:forEach var="brand" items="${subCategory.brandArray }">
					<li>
						<a href="#">${brand.name }</a>
						<ul class="items">
							<c:forEach var="product" items="${brand.productArray }">
							<li>${product.name } (UPC: ${product.upc })
								<c:if test="${not suppressShoppingList}">
									<div class="coupon-inner">
										<a href="#" class="add-to-list" data-product="${product.name }" data-brand="${brand.name.stringValue }">
											<span class="unlisted">Add to my list</span>
											<span class="listed">Item added to list</span>
										</a>
									</div>	
								</c:if>
							</li>
							</c:forEach>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</li>
			</c:forEach>
		</ul>
		</c:forEach>
	<p>*Not all items available in all stores.</p>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
  var accordionAnimation;

  if ($.browser.msie && parseInt($.browser.version, 10) < 8) {
    // No animation below IE 8! It causes content to mysteriously disappear.
    accordionAnimation = false;
  }
  else {
    accordionAnimation = "slide";
  }

  $(".gf-accordion, .gf-accordionLevel2, .gf-accordionLevel3").accordion({ autoHeight: false,
                                                                           active: false,
                                                                           collapsible: true,
                                                                           animated: accordionAnimation });

  $(".gf-accordionLevel2").bind('accordionchange', function(event, ui) {
    ui.newHeader.closest("li").addClass("open-1");
    ui.oldHeader.closest("li").removeClass("open-1");
  });

  $(".gf-accordionLevel3").bind('accordionchange', function(event, ui) {
    ui.newHeader.closest("li").addClass("open-2");
    ui.oldHeader.closest("li").removeClass("open-2");
  });
  
  $('.add-to-list').click(function(evt){
	  evt.preventDefault();
	  var $t = $(this);
	  $.ajax({
		  type: 'POST',
		  cache: false,
		  url: '/services/shoppinglist.activelist.json',
		  data: {
			 'itemTxt': $t.attr('data-brand') + ', ' + $t.attr('data-product'),
			 'itemQtyTxt': 1,
			 'itemType': 'ENTERED',
			 'itemSource': '',
			 'itemId': '',
			 'expirationDate': '',
			 'action': 'addItems'
		  },
		  error: function(jqXHR, textStatus, errorThrown) {
	  		  alert("An error has occurred while trying to add this item to your shopping list, Please try again.");	
		  },
		  success: function(data){
			  //add the listed class to the clicked element
			  $t.addClass('listed');
			  refreshShoppingListWidget(data,false);
		  },
		  dataType: 'json'
	});
  });

});
</script>