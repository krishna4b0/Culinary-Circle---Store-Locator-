<%--

  Circular Listing Widget Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.CircularListingWidget"%><%
	CircularListingWidget circularListingWidget = new CircularListingWidget(pageContext);
	pageContext.setAttribute("circularListingWidget", circularListingWidget);
%>

<div id="circular-print-view" class="widget-feature">
	<h3>View Specials</h3>
	<c:choose>
		<c:when test="${empty circularListingWidget.circulars && circularListingWidget.authorMode}">
			<cq:include script="empty.jsp"/>
		</c:when>
		<c:otherwise>
			<c:forEach var="circular" items="${circularListingWidget.circulars}">
				<div class="widget-feature-inner">
					<p>
						<a href="${circularListingWidget.viewCircularPath}.html?circularId=${circular.promotionId}&sneakPeek=${circularListingWidget.preview}&storeId=${circularListingWidget.storeId}">
							<img alt="Circular (graphic view)" src="${circular.image}">
						</a>
						<br>
						<a onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'circularListingWidget', 'View Specials-${circular.promotionId}']);" class="button" href="${circularListingWidget.viewCircularPath}.html?circularId=${circular.promotionId}&sneakPeek=${circularListingWidget.preview}&storeId=${circularListingWidget.storeId}">View Specials</a>
					</p>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>