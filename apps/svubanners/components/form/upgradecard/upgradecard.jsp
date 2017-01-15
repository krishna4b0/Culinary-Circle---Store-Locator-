<%--

 Request Card Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.UpgradeCard"%><%
	UpgradeCard upgradeCard = new UpgradeCard(pageContext);
	pageContext.setAttribute("upgradeCard",upgradeCard);
%>
<div class="create-account-progress-bar-new clearfix">
	<ul>
		<li class="account-<%=upgradeCard.getStepCssClass(1) %>"><span class="<%=upgradeCard.getStepCssClass(1) %>">My Store</span></li>
		<li class="progress-dots-spacer-2">&nbsp;</li>
		<li class="store-<%=upgradeCard.getStepCssClass(2) %>"><span class="<%=upgradeCard.getStepCssClass(2) %>">Preferred Card</span></li>
		<li class="progress-dots-spacer-3">&nbsp;</li>
		<li class="pref-<%=upgradeCard.getStepCssClass(3) %>"><span class="<%=upgradeCard.getStepCssClass(3) %>">Contact Info</span></li>
	</ul>
</div>
<div class="account-edit-section">
	<div role="alert" id="error-message-container" aria-live="assertive">
		<c:if test="${ not empty upgradeCard.errorMessages}">
		<h4>Please correct the following:</h4>
		<ul>
			<c:forEach var="message" items="${upgradeCard.errorMessages}">
			<li>${message }</li>
			</c:forEach>
		</ul>
		</c:if>
	</div>
	<c:choose>
		<c:when test="${ upgradeCard.currentStep==1}">
			<cq:include script="step1SelectStore.jsp" />
		</c:when>
		<c:when test="${ upgradeCard.currentStep==2}">
			<cq:include script="step2PreferredCard.jsp" />
		</c:when>
		<c:when test="${ upgradeCard.currentStep==3}">
			<cq:include script="step3ContactInformation.jsp" />
		</c:when>
	</c:choose>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("form").submit(function() {
		//prevent future submissions
	    $(this).submit(function() {
	    	alert("Please only submit this form once.");
	        return false;
	    });
		//but allow the first one
	    return true;
	});
});
</script>