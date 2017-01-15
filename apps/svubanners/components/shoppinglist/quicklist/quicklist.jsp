<%--

  Quick List Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.QuickList"%><%
    QuickList quickList = new QuickList(pageContext);
    pageContext.setAttribute("quickList", quickList);
%>

<%-- 
<h3>quickList.width= "${quickList.width}"</h3>
<h3>quickList.generic = "${quickList.generic}"</h3>
--%>

<c:set var="width" value="${quickList.width}" />
<c:set var="generic" value="${quickList.generic}" />

<%-- Check for an integer --%>
<c:catch var="errorStr">
    <c:set var="tempInt" value="${width / 1}" />
</c:catch>
<c:if test="${empty errorStr}">
    <%-- Its an integer, so make it pixels --%>
    <c:set var="width" value="${width}px" />
</c:if>

<c:choose>
    <c:when test="${width != ''}">
          <c:set var="style" value='style="width: ${width};"' />
    </c:when>
    <c:otherwise>
          <c:set var="style" value="" />
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${generic}">
          <c:set var="class" value=" generic" />
    </c:when>
    <c:otherwise>
          <c:set var="class" value="" />
    </c:otherwise>
</c:choose>

<c:set var="listTitle" value="${fn:trim(quickList.title)}" />
<c:set var="listDescription" value="${fn:trim(quickList.description)}" />

<c:choose>
    <c:when test="${listTitle != '' || listDescription != ''}">
          <c:set var="hasTitle" value="true" />
    </c:when>
    <c:otherwise>
          <c:set var="hasTitle" value="false" />
    </c:otherwise>
</c:choose>
    
<c:choose>
    <c:when test="${empty quickList.items && quickList.authorMode}">
        <cq:include script="empty.jsp"/>
    </c:when>
    <c:otherwise>
        <div class="quick-list${class}" ${style}>
            <form id="frm-quick-list-detail" action="/services/shoppinglist.activelist.html" method="post">
                <div class="quick-list-details">
                    <c:if test="${listTitle != ''}">
                      <h5>${listTitle}</h5>
                    </c:if>
                    <c:if test="${listDescription != ''}">
                      <h6>${listDescription}</h6>
                    </c:if>
                    <ul class="quick-list-items">
                        <c:set var="i" value="0" />
                        <c:forEach  var ="item" items="${quickList.items}">
                            <c:choose>
                                <c:when test="${!hasTitle and i eq 0}">
                                      <c:set var="itemStyle" value=' style="border-top: 0;"' />
                                </c:when>
                                <c:otherwise>
                                      <c:set var="itemStyle" value="" />
                                </c:otherwise>
                            </c:choose>
                            <li${itemStyle}>  
                            	<c:if test="${not suppressShoppingList}">                          	
                                	<input id="ql-item-${i}" type="checkbox" name="selections" value="${i}">
                                </c:if>
                                <label for="ql-item-${i}">${item.title}</label>                                
                                <input type="hidden" name="itemTxt" value="${item.title}" />
                                <input type="hidden" name="itemQtyTxt" value="1" />
                                <input type="hidden" name="itemType" value="ENTERED" />
                                <input type="hidden" name="itemSource" value="Quicklist" />
                            </li>
                            <c:set var="i" value="${i + 1}" />
                        </c:forEach>
                    </ul>
                    <c:if test="${not suppressShoppingList}">
                    <div role="navigation">
	                    <ul class="select-add">
	                        <li id="left">
	                            <a id="select-all" href="#">SELECT ALL</a>
	                        </li>
	                        <li id="right-add">
	                            <input id="add-items" type="submit" value="ADD TO LIST">
	                        </li>
	                    </ul>
                    </div>
                    </c:if>
                    <c:if test="${ not empty quickList.shoppingListLink}">
	                    <div class="right">
	                        <a id="select-all" href="${quickList.shoppingListLink}.html">${quickList.shoppingListLinkLabel} &gt;</a>
	                    </div>
                    </c:if>
                    <input id="totalItems" type="hidden" name="totalItems" value="${i}" />
                    <input type="hidden" name="forceSelections" value="true" />
                    <input type="hidden" name="action" value="addItems" />
                    <input type="hidden" name="resource" value="${currentPage.path }.html" />
                </div>
            </form>
            <c:if test="${quickList.imageQuicklist }">
                <div class="quick-list-media">
                    <c:forEach var="item" items="${quickList.items}" varStatus="status" >
                        <c:choose>
                            <c:when test="${status.count == 1}">
                                <img src="${item.imagePath}" style="display: inline;">
                            </c:when>
                            <c:otherwise>
                                <img src="${item.imagePath}" style="display: none;">
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </c:otherwise>
</c:choose>
<script type="text/javascript">
$(document).ready(function(){
    <c:if test="${quickList.imageQuicklist }">
     $('.quick-list-media img').hide();
     $('.quick-list-media img').first().show();
     </c:if>
     
     $('.quick-list-items li').mouseenter(function(){
        $(this).addClass('hover');
        
        <c:if test="${quickList.imageQuicklist }">
        var qlImages = $('.quick-list-media img');
        qlImages.hide();
        
        var thisIndex = $(this).index();
        qlImages.eq(thisIndex).show();
        </c:if>
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
    
    
    $('#add-items').click(function(evt){
        evt.preventDefault();
        
        if(typeof _gaq !== 'undefined'){
            var frmDataArray = $('#frm-quick-list-detail').serializeObject();
            var selectedItems = frmDataArray.selections;
            var itemTxts = frmDataArray.itemTxt;
            for(var i=0;i<selectedItems.length;i++) {
                var selectionIndex = selectedItems[i];
                var selectedItemName = encodeURI(itemTxts[selectionIndex]);
                //_gaq.push(['_trackEvent', '${currentPage.title }', 'Quicklist', selectedItemName]);
            }
        }
        
        $.ajax({
              type: 'POST',
              cache: false,
              url: '/services/shoppinglist.activelist.json',
              data: encodeURI($('#frm-quick-list-detail').serialize()),
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