<%--

	Rewards Header Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.rewards.RewardsHeader"%><%
	RewardsHeader rewardsHeader = new RewardsHeader(pageContext);
	pageContext.setAttribute("rewardsHeader", rewardsHeader);
%>
<div class="top" id="rrdiv16">
	<a href="${rewardsHeader.signupPath }.html?editSection=updatealtid#rewards-signup-section" class="sign-up-now" id="rrtaa51">&nbsp;</a>
</div>
<div class="bottom" id="rrdiv17">
	<div class="left" id="rrdiv18">
		${rewardsHeader.leftRichText }
	</div>
	<div class="right" id="rrdiv19">
		${rewardsHeader.rightRichText }
	</div>
</div>