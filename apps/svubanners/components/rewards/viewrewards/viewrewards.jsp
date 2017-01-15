<%--

  View Rewards Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.rewards.ViewRewards"%><%
	ViewRewards viewRewards = new ViewRewards(pageContext);
	pageContext.setAttribute("viewRewards",viewRewards);
		
%>
<div class="summary">
	<c:choose>
		<c:when test="${not empty viewRewards.rewardsCardNumber}">
			<div style="padding-top: 35px; *padding-top: 55px;" class="container tabbed clearfix">
				<div class="container-top">&nbsp;</div>
				<div class="tabs">
					<c:if test="${not viewRewards.hideRewards }">
						<h1 <c:if test="${not viewRewards.gasRewards }">class="active"</c:if>>
							<a id="toggle-pref" href="${currentPage.path }.html"><span>My Preferred Rewards</span></a>
						</h1>
					</c:if>
					<c:if test="${not viewRewards.hideGasRewards }">
						<h1 <c:if test="${viewRewards.gasRewards }">class="active"</c:if>>
							<a id="toggle-gas" href="${currentPage.path }.html?rewardsCategory=fuel"><span>My Gas Rewards</span></a>
						</h1>
					</c:if>
				</div>
				<div class="pad-fix">
					<div class="container-top">&nbsp;</div>
					<div style="float: left; width: 543px;" class="container-inner clearfix">
						<div id="pref" class="pref">
							<div class="user">
								<h2>${viewRewards.userDisplayName }</h2>
								<p>Rewards Card # ${viewRewards.rewardsCardNumber }</p>
							</div>
							<c:choose>
								<c:when test="${not viewRewards.gasRewards && not viewRewards.hideRewards }">
									<c:choose>
										<c:when test="${viewRewards.hasRewardsCard}">
											<div class="col-1">
												<h3>Current point balance</h3>
												<span><fmt:formatNumber value="${viewRewards.rewards.currentPoints - 0 }" type="number"/>&nbsp;</span>
												<h3>Points needed to next Reward</h3>
												<span><fmt:formatNumber value="${viewRewards.pointForAward - viewRewards.rewards.currentPoints }" type="number"/>&nbsp;</span>
												<h3>$5 Rewards available</h3>
												<span><fmt:formatNumber value="${viewRewards.rewards.rewardsAvailable - 0 }" type="number"/>&nbsp;</span>
											</div>
											<div class="col-2">
												<h3>Points earned this quarter</h3>
												<span><fmt:formatNumber value="${viewRewards.rewards.pointsEarnedThisCuarter - 0 }" type="number"/>&nbsp;</span>
												<h3>$5 Rewards earned this quarter</h3>
												<span><fmt:formatNumber value="${viewRewards.rewards.rewardsEarnedThisQuarter - 0 }" type="number"/>&nbsp;</span>
												<h3>$5 Rewards redeemed this quarter</h3>
												<span><fmt:formatNumber value="${viewRewards.rewards.rewardsRedeemedThisQuarter - 0 }" type="number"/>&nbsp;</span>
											</div>
											<div class="points-to-rewards">
												<div class="icon">&nbsp;</div>
												<span>${viewRewards.awardText }</span>
											</div>
										</c:when>
										<c:otherwise>
											<p>You must enroll in rewards to view your rewards points.</p>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${viewRewards.gasRewards && not viewRewards.hideGasRewards }">
									<div class="col-1">
										<h3>Current available balance</h3>
										<fmt:setLocale value="en_US"/>
										<span><fmt:formatNumber value="${viewRewards.rewards.currentBalance - 0 }" type="currency"/>&nbsp;</span>
										<h3>Expires within 7 days</h3>
										<span><fmt:formatNumber value="${viewRewards.rewards.expiringSoon - 0 }" type="currency"/>&nbsp;</span>
									</div>
									<div class="col-2">
										<h3>Current Date</h3>
										<span>${viewRewards.currentDate }&nbsp;</span>
									</div>
									<div class="points-to-rewards">
										<div class="icon">&nbsp;</div>
										<span>${viewRewards.gasAwardText }</span>
									</div>
								</c:when>
								<c:otherwise>
									Rewards information is currently not available for this store.
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${not viewRewards.gasRewards }">
				<div class="clearfix details">
				<div class="container">
					<div class="container-top">&nbsp;</div>
						<div class="container-inner">
							<div class="typical">
								<h2>Will my $5 Rewards Certificates expire?</h2>
								${viewRewards.expirationContent }
							</div>
						</div>
					</div>
				</div>
				</c:when>
				<c:otherwise>
				<div class="details">
					<div class="container">
						<div class="container-top">&nbsp;</div>
						<div class="container-inner">
							<div class="typical">
								${viewRewards.gasProgramDetails }
							</div>
						</div>
					</div>
				</div>
				</c:otherwise>
			</c:choose>
			
			<div class="transaction">
				<h1>Transaction History</h1>
				<table class="rewards-summary-data">
					<thead>
						<tr>
							<c:choose>
								<c:when test="${not viewRewards.gasRewards }">
									<th class="center-align first">TRANS DATE</th>
									<th class="center-align">STORE</th>
									<th class="center-align">CARD #</th>
									<th>NAME</th>
									<th class="center-align">REWARDS<br> ISSUED</th>
									<th class="center-align last">REWARDS<br> REDEEMED</th>
								</c:when>
								<c:otherwise>
									<th class="center-align first">TRANS DATE</th>
									<th class="center-align">STORE</th>
									<th class="center-align">CARD #</th>
									<th class="center-align">$ EARNED</th>
									<th class="center-align">$ REDEEMED</th>
									<th class="center-align last">DISCOUNTED<br> GALLONS</th>
								</c:otherwise>
							</c:choose>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not viewRewards.gasRewards }">
								<c:forEach var="trans" items="${viewRewards.rewards.transactions }">
									<tr>
										<td><fmt:formatDate type="date" value="${trans.transactionDate }"/></td>
										<td>${trans.transactionLocation }</td>
										<td>${viewRewards.rewards.cardNumber }</td>
										<td>${trans.transactionUser }</td>
										<c:choose>
											<c:when test="${trans.transactionType == 'REDEMPTION' }">
												<td>&nbsp;</td>
												<td><fmt:formatNumber value="${trans.transactionAmount }" type="number"/> ${trans.transactionUnit }</td>
											</c:when>
											<c:when test="${trans.transactionType == 'AWARD' }">
												<td><fmt:formatNumber value="${trans.transactionAmount }" type="number"/> ${trans.transactionUnit }</td>
												<td>&nbsp;</td>
											</c:when>
											<c:when test="${trans.transactionType == 'PURCHASE' }">
												<td>${trans.transactionAmount } ${trans.transactionUnit }</td>
												<td>&nbsp;</td>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="trans" items="${viewRewards.rewards.transactions }">
									<tr>
										<td><fmt:formatDate type="date" value="${trans.transactionDate }"/></td>
										<td>${trans.transactionLocation }</td>
										<td>${viewRewards.rewards.cardNumber }</td>
										<c:choose>
											<c:when test="${trans.transactionType == 'REDEMPTION' }">
												<td>&nbsp;</td>
												<td><fmt:formatNumber value="${trans.transactionQuanity }" type="number" minFractionDigits="2"/></td>
												<td>${trans.transactionAmount }</td>
											</c:when>
											<c:when test="${trans.transactionType == 'AWARD' }">
												<td><fmt:formatNumber value="${trans.transactionQuanity }" type="number" minFractionDigits="2"/></td>
												<td>&nbsp;</td>
												<td>${trans.transactionAmount }</td>
											</c:when>
											<c:when test="${trans.transactionType == 'PURCHASE' }">
												<td><fmt:formatNumber value="${trans.transactionQuanity }" type="number" minFractionDigits="2"/></td>
												<td>&nbsp;</td>
												<td>${trans.transactionAmount }</td>
											</c:when>
									</c:choose>
								</tr>							
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<div class="disclaimer-note">
				
					<c:set var="category" value="" />
					<c:if test="${viewRewards.gasRewards }">
						<c:set var="category" value="fuel" />
					</c:if>
						
					<c:choose>
						<c:when test="${viewRewards.previousQuarter }">
						<a href="${currentPage.path }.html?rewardsCategory=${category }">See Current Quarter</a>
						</c:when>
						<c:otherwise>
						<a href="${currentPage.path }.html?rewardsCategory=${category }&quarter=1">See Previous Quarter</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="disclaimer-note">* Points and Rewards balances may take up to 24 hours to post.</div>
			</div>
		</c:when>
		<c:otherwise>			
			Please sign up for a card to view your rewards point information
		</c:otherwise>
	</c:choose>
</div>