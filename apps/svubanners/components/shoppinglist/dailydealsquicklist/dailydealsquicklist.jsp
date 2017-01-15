<%--

  Full Page Quick List Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.DailyDealsQuickList"%><%
    DailyDealsQuickList dailyDealsQuickList = new DailyDealsQuickList(pageContext);
    pageContext.setAttribute("dailyDealsQuickList", dailyDealsQuickList);
%>

<c:choose>
    <c:when test="${empty dailyDealsQuickList.items && dailyDealsQuickList.authorMode}">
        <cq:include script="empty.jsp"/>
    </c:when>
    <c:otherwise>
        <c:if test="${dailyDealsQuickList.shouldRender }" >
            <div class="quicklist-column">
                <form id="frm-ql-1" action="/services/shoppinglist.activelist.html" method="post">

                    <div class="quicklist-seperator"></div>
                    <div class="quicklist-row">
                        <c:set var="i" value="0" />
                        <c:forEach var="item" items="${dailyDealsQuickList.items}" varStatus="status">
                                <div class="quicklist-item">
                                <div class = "image">
                                    <img src="${item.imagePath}" alt="">
                                 </div>
                                 <div class = "price">${item.price}</div>
                                  <c:set var="itemTitle" value="${fn:replace(item.title, '[BR]', '<br />')}" />
                                  <c:set var="itemTitle" value="${fn:replace(itemTitle, '[B]', '<strong>')}" />
                                  <c:set var="itemTitle" value="${fn:replace(itemTitle, '[/B]', '</strong>')}" />
                                  <c:set var="itemTitle" value="${fn:replace(itemTitle, '[I]', '<em>')}" />
                                  <c:set var="itemTitle" value="${fn:replace(itemTitle, '[/I]', '</em>')}" />
                                  <div class = "description">${itemTitle}</div>

                                  <c:set var="itemDescription" value="${fn:replace(item.description, '[BR]', '<br />')}" />
                                  <c:set var="itemDescription" value="${fn:replace(itemDescription, '[B]', '<strong>')}" />
                                  <c:set var="itemDescription" value="${fn:replace(itemDescription, '[/B]', '</strong>')}" />
                                  <c:set var="itemDescription" value="${fn:replace(itemDescription, '[I]', '<em>')}" />
                                  <c:set var="itemDescription" value="${fn:replace(itemDescription, '[/I]', '</em>')}" />
                                  <div class = "description">${itemDescription}</div>
								  <c:if test="${not suppressShoppingList}">
                                  	<a id="add-item-link-${i}" data-itemname="${item.title}" href="/services/shoppinglist.activelist.html?itemTxt=${item.title}&amp;itemQtyTxt=1&amp;itemType=ENTERED&amp;itemSource=addToList&amp;action=addItems&amp;resource=${currentPage.path }.html" class="button add-to-list" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'dailydealsquicklist', '+ Add to list']);">+ Add to list</a>
                                  </c:if>
                                </div>
                                <c:if test = "${status.count % 5 == 0 }">
                                <!-- Every 5 products insert a separator close the quick list row and create a new one. -->
                                    <div class="quicklist-seperator"></div>
                                    </div>
                                    <div class="quicklist-row">
                                </c:if>
                                <c:set var="i" value="${i + 1}" />
                        </c:forEach>
                    </div>
                </form>
            </div>
            <script type="text/javascript">
            $(document).ready(function(){
                $('.quicklist-item > a[id^=add-item-link-]').click(function(evt){
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
    </c:otherwise>
</c:choose>

