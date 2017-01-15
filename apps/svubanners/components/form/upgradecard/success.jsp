<%--

 Replace Card Component - Success script

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.UpgradeCard"%><%
UpgradeCard upgradeCard = new UpgradeCard(pageContext);
pageContext.setAttribute("upgradeCard",upgradeCard);
%>
<h1 class="replace-card">Replace Lost Card</h1>
<div class="container">
	<div class="container-top">&nbsp;</div>
	<div id="replace-card-wrapper" class="container-inner clearfix">
		<div class="left-content">
			<p>We have received your request for a replacement Preferred Rewards Card.</p>
			<p>If you have requested a card be mailed to you, it will arrive in one to three weeks. You can print this temporary card and use it until your new card arrives.</p>
			<h3 class="replace-card">What would you like to do next?</h3>
			<ul>
				<li>Learn more about <a href="${replaceCard.rootPath }/tools/rewards-card.html">Preferred Savings Card</a></li>
				<li>Look at my <a href="${replaceCard.rootPath }/shopping-list.html">Shopping List</a></li>
				<li>Visit my <a href="${replaceCard.rootPath }/recipes/view-my-recipes.html">Recipe Box</a></li>
			</ul>
		</div>
		<div class="right-content"></div>
	</div>
</div>