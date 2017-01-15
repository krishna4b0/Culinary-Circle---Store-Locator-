<%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.rewards.RewardsTeaser"%><%
	RewardsTeaser rewardsTeaser = new RewardsTeaser(pageContext);
	pageContext.setAttribute("rewardsTeaser",rewardsTeaser);
		
%>
<c:choose>
	<c:when test="${rewardsTeaser.userType=='preferredRewardsCard'}">
	<div class="rewards-teaser-widget noImage">
		<h3>${rewardsTeaser.preferredHeadline }</h3>
		<h4>Current points balance</h4>
		<p><fmt:formatNumber value="${rewardsTeaser.rewards.currentPoints - 0}" type="number"/></p>
		<h4>$5 rewards available</h4>
		<p><fmt:formatNumber value="${rewardsTeaser.rewards.rewardsAvailable - 0}" type="number"/></p>
		<h4>Current earning period ends in</h4>
		<p>${rewardsTeaser.rewards.endingDate }</p>
	</div>
	</c:when>
	<c:when test="${rewardsTeaser.userType=='preferredRewardsNoCard'}">
	<div class="image rewardsNoCard"></div>
	<div class="rewards-teaser-widget">
		<h3>${rewardsTeaser.preferredHeadlineNC }</h3>
		<p>${rewardsTeaser.preferredDescriptionNC }</p>
		<a href="${rewardsTeaser.preferredLinkNC }.html" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'rewardsTeaser', 'Sign Up!']);">Sign Up!</a>
	</div>
	</c:when>
	<c:otherwise>
	<div class="image savingsCard"></div>
	<div class="rewards-teaser-widget">
		<h3>${rewardsTeaser.savingsHeadline }</h3>
		<p>${rewardsTeaser.savingsDescription }</p>
		<a href="${rewardsTeaser.savingsLink }.html" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'rewardsTeaser', 'Sign Up!']);">Sign Up!</a>
	</div>
	</c:otherwise>
</c:choose>