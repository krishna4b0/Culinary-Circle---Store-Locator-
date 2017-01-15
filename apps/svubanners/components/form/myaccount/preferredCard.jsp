<%--

 Edit My Account Form Component. My Store Section


--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormPreferredCard" %><%
	MyAccountFormPreferredCard prefCard = new MyAccountFormPreferredCard(pageContext);
	pageContext.setAttribute("prefCard", prefCard);
%>
<!--  <c:if test="${prefCard.isAssociate == true}">
</c:if>-->
<!-- <c:if test="${prefCard.preferredCardStatus == 'GETONE'}">
</c:if>-->
<c:if test="${prefCard.editSection != 'updatealtid' }">
	<div class="account-edit-section">
		<h2 id="rewards-signup-section">${loyaltyProgramName} Card Information</h2>
		<div class="account-edit-section-guts">
			<div class="account-section-details">
				<div class="clearfix">
					<div class="col-1">
						<div class="label">Card Number</div>

						<c:choose>
							<c:when test="${prefCard.preferredCardStatus eq 'YES'}">
								<div class="value personal">${prefCard.card.cardNumber }</div>
								<c:if test="${prefCard.isAssociate != true }">
									<ul class="card-options">
										<li><a href=# class="ss-remove-card">Remove this card</a></li>
										<li><a href="${prefCard.replaceCardPath }.html">Replace lost card</a></li>
										<li><a href="${prefCard.printTemporaryCardPath }.html">Print temporary card</a></li>
									</ul>
								</c:if>
								<c:if test="${prefCard.isAssociate == true }">
									<ul class="card-options">
										<li><a href=# class="ss-remove-card">Remove this card</a></li>
									</ul>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${prefCard.isAssociate == true }">
								<span>To replace your associate card, contact your HR department. When you have a new card, you can <a href="#" class="ss-link-associate-card">link it to your account.</a></span>
								</c:if>
								<c:if test="${prefCard.isAssociate != true }">
								<span>You currently do not have a ${loyaltyProgramName} Card associated with your profile.</span>
								<ul>
									<li><a href=# class="ss-create-new-card">Request a new card</a></li>
									<li><a href=# class="ss-add-existing-card">Add my existing card number</a></li>
								</ul>
								</c:if>
							</c:otherwise>
						</c:choose>	
					</div>

					<c:if test="${(not prefCard.hideCardlessId) and (prefCard.isAssociate != true)}">
						<div class="col-2">
							<h2 class="label altid-popup-header">Card-less ID <a href="#"></a>
								<div>
									<h3>What is a Card-less ID?</h3>
									<p>Your Card-less ID is a 11-digit number. You can save coupons to your number and redeem them at the register - no more paper!</p>
									<p><strong>We recommend using your phone number and a 4 digit PIN.</strong></p>
								</div>
							</h2>
							<div class="value personal current-cardlessid">
								${prefCard.card.alternateId }
							</div>
							<ul>
								<c:choose>
									<c:when test="${not empty prefCard.card.alternateId}">
										<li><a class="ss-update-cardlessid" href="#">Update Card-less ID</a></li>
									</c:when>
									<c:otherwise>
									<li><a class="ss-create-cardlessid" href="#">Add Card-less ID</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</div>
</c:if>
