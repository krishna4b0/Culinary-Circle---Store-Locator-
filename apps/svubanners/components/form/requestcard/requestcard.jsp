<%--

 Request Card Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.RequestCard"%><%
	RequestCard requestCard = new RequestCard(pageContext);
	pageContext.setAttribute("requestCard",requestCard);
%>
<c:set var="readOnly" value="" />
<c:set var="disableDropDown" value="" />
<c:if test="${requestCard.readOnly }">
<c:set var="readOnly" value="readonly='readonly'" />
<c:set var="disableDropDown" value="disabled= 'disabled'"/>
</c:if>
<script src="/etc/designs/svubanners/master/qas/js/qas.js"></script>
<div class="account-edit-section">
	<h1>Contact Information</h1>
	<div role="alert" id="error-message-container" aria-live="assertive">
	<c:if test="${not empty requestCard.errors }">
	<h2>Please correct the following:</h2>
	<ul>
	<c:forEach var="error" items="${requestCard.errors }">
		<li>${fn:escapeXml(error) }</li>
	</c:forEach>
	</ul>
	</c:if>
	</div>
	<span class="account-required">* Required</span>
	
	<div style=" float: left;" class="container">
		<div class="container-top">&nbsp;</div>
		<div style=" width: 543px; float: left;" class="container-inner">
			<div style=" float: left;" class="account-section-details">
				<div id="frmContact">
					<div class="clearfix margin-bottom">
						<div class="col-1">
							<div class="inline">
								<label for="first-name" class="label edit">&nbsp;&nbsp;&nbsp; <span class="required">*</span> First Name </label>
								<input ${readOnly } value="${fn:escapeXml(requestCard.userFirstName) }" type="text" title="First Name" style=" margin-right: 10px; width: auto;" name="firstName" 
									maxlength="50" id="first-name" aria-required="true" aria-invalid="false">
							</div>
							<div class="inline">
								<label for="last-name" class="label edit">&nbsp;&nbsp;&nbsp; <span class="required">*</span> Last Name </label>
								<input ${readOnly } value="${fn:escapeXml(requestCard.userLastName) }" type="text" title="Last Name" style=" width: 137px;" name="lastName" maxlength="50" 
									id="last-name" aria-required="true" aria-invalid="false">
							</div>
						</div>
					</div>
					<div class="col-1 margin-bottom">
						<div class="inline">
							<label for="address1" class="label edit">&nbsp;&nbsp;&nbsp; <span class="required">*</span> Address </label>
							<input ${readOnly } value="${fn:escapeXml(requestCard.userAddress) }" type="text" title="Address" name="homeAddress.address1" maxlength="200" id="address1" 
								aria-required="true" aria-invalid="false">
						</div>
						<div class="inline">
							<label for="address2" class="label edit">&nbsp;Apt/Suite </label>
							<input ${readOnly } value="${fn:escapeXml(requestCard.userAddress2) }" type="text" title="Apartment / Suite #" name="homeAddress.address2" maxlength="100" id="address2" 
								aria-invalid="false">
						</div>
					</div>
					<div class="col-1 margin-bottom">
						<div class="inline">
							<label for="city" class="label edit">&nbsp;&nbsp;&nbsp; <span class="required">*</span> City </label>
							<input ${readOnly } value="${fn:escapeXml(requestCard.userCity) }" type="text" title="City" name="homeAddress.city" maxlength="50" id="city" 
								aria-required="true" aria-invalid="false">
						</div>
						<div class="inline">
							<label for="state" class="label edit">&nbsp; <span class="required">*</span> State </label>
							<select ${disableDropDown } name="homeAddress.state" class="" id="state" title="State" aria-required="true" aria-invalid="false" tabindex="">
								<option value="">--</option>
								<c:forEach var="state" items="${requestCard.statesInstance }">
								<option <c:if test="${requestCard.userState == state.key }">selected="selected"</c:if>value="${state.key }">${state.key }</option>
								</c:forEach>
							</select>
							<c:if test="${requestCard.readOnly }">
                            	<input value="${fn:escapeXml(requestCard.userState) }" type="hidden" name="homeAddress.state">
                            </c:if>
						</div>
						<div class="inline">
							<label for="zip" class="label edit">&nbsp;&nbsp;&nbsp; <span class="required">*</span> ZIP </label>
							<input ${readOnly } value="${fn:escapeXml(requestCard.userZipCode) }" type="text" title="ZIP" name="homeAddress.zipCode" maxlength="10" id="zip" aria-required="true" 
								aria-invalid="false">
						</div>
					</div>
				</div>
				<div style=" padding: 0; clear: left; width: 163px; float: left;">
					<div class="clearfix margin-bottom">
						<div class="col-1">
							<strong>&nbsp;Home Phone Number </strong>
							<label class="wai" for="home-phone1">Home area code</label>
							<input value="${fn:substring(requestCard.userHomePhone,0,3)}" type="text" title="Home Phone" name="homePhoneArea" maxlength="3" id="home-phone1" aria-invalid="false">
							<span class="hyphen">-</span>
							<label class="wai" for="home-phone2">Home phone first 3 digits</label>
							<input value="${fn:substring(requestCard.userHomePhone,3,6)}" type="text" title="Home Phone" name="homePhonePrefix" maxlength="3" id="home-phone2" aria-invalid="false">
							<span class="hyphen">-</span>
							<label class="wai" for="home-phone3">Home phone last 4 digits</label>
							<input value="${fn:substring(requestCard.userHomePhone,6,10)}" type="text" title="Home Phone" name="homePhoneLineNumber" maxlength="4" id="home-phone3" aria-invalid="false">
						</div>
					</div>
					<div class="clearfix margin-bottom">
						<div style=" width: 165px;" class="col-1">
							<strong>Mobile Phone Number </strong>
							<label class="wai" for="mobile-phone1">mobile area code</label>
							<input value="${fn:substring(requestCard.userCellPhone,0,3)}" type="text" title="Mobile Phone" name="cellPhoneArea" maxlength="3" id="mobile-phone1" aria-invalid="false">
							<span class="hyphen">-</span>
							<label class="wai" for="mobile-phone2">mobile phone first 3 digits</label>
							<input value="${fn:substring(requestCard.userCellPhone,3,6)}" type="text" title="Mobile Phone" name="cellPhonePrefix" maxlength="3" id="mobile-phone2" aria-invalid="false">
							<span class="hyphen">-</span>
							<label class="wai" for="mobile-phone3">mobile phone last 4 digits</label>
							<input value="${fn:substring(requestCard.userCellPhone,6,10)}" type="text" title="Mobile Phone" name="cellPhoneLineNumber" maxlength="4" id="mobile-phone3" aria-invalid="false">
						</div>
					</div>
					<c:choose>
						<c:when test="${requestCard.loyaltyProgram == 'DISCOUNT'}">
					<c:if test="${not requestCard.hideCardlessId }">
					<div class="clearfix margin-bottom">
						<div style=" width: 165px;" class="col-1">
							<strong>Card-less ID </strong>
							<label for="alt-id1" class="wai">first 7 digits for cardless ID</label>
							<input ${readOnly } value="${fn:substring(requestCard.userAltId,0,7)}" type="text" title="Alternate Id" name="tempAltIdLineNumber" maxlength="7" id="alt-id1" aria-invalid="false">
							<label for="alt-id2" class="wai">last 4 digits for cardless ID</label>
							<input ${readOnly } value="${fn:substring(requestCard.userAltId,7,10)}" type="text" title="Alternate Id" name="tempAltIdAreaCode" maxlength="4" id="alt-id2" aria-invalid="false">
						</div>
					</div>
					</c:if>
				</div>
				<c:if test="${not requestCard.hideCardlessId }">
				<div id="help-tool-tip" class="card-less-id-help">
					<div id="help-tool-tip-content" class="drop-shadow">
						<strong>What is my Card-less ID?</strong>
						<p>This is a secure number you can use at checkout in place of swiping your card.</p>
						<p class="last"> Please choose an 11 digit number that you can easily remember.<br><br>
						We recommend you use your 7-digit phone number (without area code) + a 4-digit PIN as your Card-less ID. 
						</p>
					</div>
				</div>
				</c:if>
						</c:when>
						<c:otherwise>
					<c:if test="${not requestCard.hideCardlessId }">
					<div class="clearfix margin-bottom">
						<div style=" width: 165px;" class="col-1">
							<span class="label edit"><strong>Card-less ID </strong> </span>
							<label for="alt-id1" class="wai">first 7 digits for cardless ID</label>
							<input ${readOnly } value="${fn:substring(requestCard.userAltId,0,7)}" type="text" title="Alternate Id" name="tempAltIdLineNumber" maxlength="7" id="alt-id1" aria-invalid="false">
							<label for="alt-id2" class="wai">last 4 digits for cardless ID</label>
							<input ${readOnly } value="${fn:substring(requestCard.userAltId,7,11)}" type="text" title="Alternate Id" name="tempAltIdAreaCode" maxlength="4" id="alt-id2" aria-invalid="false">
						</div>
					</div>
					</c:if>
				</div>
				<c:if test="${not requestCard.hideCardlessId }">
				<div id="help-tool-tip" class="card-less-id-help">
					<div id="help-tool-tip-content" class="drop-shadow">
						<strong>What is my Card-less ID?</strong>
						<p>This is a secure number you can use at checkout in place of swiping your card.</p>
						<p class="last"> Please choose an 11 digit number that you can easily remember.<br><br>
						We recommend you use your 7-digit phone number (without area code) + a 4-digit PIN as your Card-less ID. 
						</p>
					</div>
				</div>
				</c:if>
						</c:otherwise>
					</c:choose>
					
			</div>
			<div style=" padding: 5px 15px 15px 15px;">
				<strong>Savings by Mail</strong>
				<p>Do you like coupons? Do you love special savings? Sign up to receive exclusive coupons and news delivered right to your door.</p>
				<p class="no-margin-bottom">
					<input type="checkbox" title="I'd like to receive Albertsons updates by mail" name="usMailOptIn" id="input-mail-savings" 
						class="checkbox" checked="${requestCard.userMailOptIn ? 'checked' : '' }">
					<label for="input-mail-savings">&nbsp;&nbsp;I'd like to receive ${bannerName } updates by mail&nbsp;</label>
				</p>
			</div>
		</div>
	</div>
	<div class="account-edit-actions">
		<input value="${requestCard.loyaltyProgram }" type="hidden" name="loyaltyProgram">
		<input value="${requestCard.requestType }" type="hidden" name="preferredCard">
		<input value="${requestCard.lookupCardNumber }" type="hidden" name="lookupCardNumber">
		<input value="${requestCard.lookupLastName }" type="hidden" name="lookupLastName">
		<button id="saveAndContinue" type="submit" name="save" class="button" onclick="try {//_gaq.push(['_trackEvent', '${currentPage.title }', 'requestcard', 'Save and Continue'])} catch (e) {}; return QAS_Verify();">Save and Continue </button>
	</div>
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