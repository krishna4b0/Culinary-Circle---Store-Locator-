<%--

Rewards Number Component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormRewardsnumber" %><%
MyAccountFormRewardsnumber myRewards = new MyAccountFormRewardsnumber(pageContext);
pageContext.setAttribute("myRewards", myRewards);
%>
<c:choose>
	<c:when test="${empty myRewards.rewardsNumber}">
		<div class="account-edit-section rewards-edit-section">
			<h2 class="altid-popup-header">Rewards Number <a href="#"></a>
				<div>
					<h3>What is a Rewards Number?</h3>
					<p>Your Rewards Number is a 10-digit number. You can save coupons to your number and redeem them at the register - no more paper!</p>
					<p><strong>We recommend using your phone number.</strong></p>
				</div>
			</h2>
			<div class="account-edit-section-guts">
				<div class="account-section-details">
					<a href="#" class="edit ss-create-rewardsnumber">Add</a>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="account-edit-section rewards-edit-section">
            <h2>Rewards Number</h2>
			<div class="account-edit-section-guts">
                <div class="account-section-details">
                	${myRewards.rewardsNumber}
					<a href="#" class="edit ss-update-rewardsnumber">Edit</a>
                </div>
			</div>
		</div>
	</c:otherwise>
</c:choose>