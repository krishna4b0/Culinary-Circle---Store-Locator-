<%--

  Circular Listing Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.CircularListing"%><%
	CircularListing circularListing = new CircularListing(pageContext);
	pageContext.setAttribute("circularListing", circularListing);
%>
	<div class="title section">
	<h1>Weekly Ads and More</h1>
	</div>
<c:choose>
	<c:when test="${empty circularListing.circulars}">
		No weekly ad specials found.
	</c:when>
	<c:otherwise>
		<c:forEach var="circular" items="${circularListing.circulars}" varStatus="status">
			<c:choose>
				<c:when test="${status.index==0 }">
					<div class="tile1">
				</c:when>
				<c:otherwise>
					<div class="tile">
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${circular.sneakpeek}">
					<h2 class="sneak-peek">Sneak Peek!</h2>
				</c:when>
				<c:otherwise>
					<h2 class="sneak-peek">Current Savings</h2>
				</c:otherwise>
			</c:choose>
			<h3>Valid from ${circular.startDate} - ${circular.endDate}</h3>
			<a href="${circularListing.viewCircularPath}.html?circularId=${circular.promotionId}&sneakPeek=${circular.sneakpeek}&storeId=${circularListing.storeId}">
				<img alt="${circular.promoType}" src="${circular.image}">
			</a>				
			<br>				
			<p>
				<a class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'circularListing', 'View Now-${circular.promotionId}']);" href="${circularListing.viewCircularPath}.html?circularId=${circular.promotionId}&sneakPeek=${circular.sneakpeek}&storeId=${circularListing.storeId}">
					<c:choose>
						<c:when test="${circular.sneakpeek}">
							Take a Peek
						</c:when>
						<c:otherwise>
							View Now
						</c:otherwise>
					</c:choose>		
				</a>
			</p>
			<a class="hide-for-screen-reader" href="${circularListing.listCircularPage}.html?circularId=${circular.promotionId}&amp;sneakPeek=${circular.sneakpeek}&amp;storeId=${circularListing.storeId}">
				View text version of circular effective ${circular.startDate} to ${circular.endDate}
			</a>
		</div>
		</c:forEach>
	</c:otherwise>
</c:choose>