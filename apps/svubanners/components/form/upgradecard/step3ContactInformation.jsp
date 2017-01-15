<%--

 Create Account Form Component.
 
 Step 4

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.createaccount.CreateAccountFormStep4" %><%
	CreateAccountFormStep4 formStep4 = new CreateAccountFormStep4(pageContext);
	pageContext.setAttribute("formStep4", formStep4);
%>
<c:set var="readOnly" value="" />
<c:set var="disableDropDown" value="" />
<c:if test="${formStep4.readOnly }">
	<c:set var="readOnly" value="readonly='readonly'" />
	<c:set var="disableDropDown" value="disabled= 'disabled'"/>
</c:if>
<span class="account-required">* Required</span>
		<h3>Contact Information</h3>
		<div style=" float: left;" class="container">
			<div class="container-top">&nbsp;</div>
			<div style=" float: left; width: 543px;" class="container-inner">
				<div style=" float: left;" class="account-section-details">
					<div id="frmContact">
						<div class="clearfix margin-bottom">
							<div class="col-1">
								<div class="inline" id="firstname">
									<label for="first-name" class="label edit">&nbsp;&nbsp; <span class="required">*</span> First Name </label>
									<input ${readOnly } x-moz-errormessage="Please enter First Name" value="${fn:escapeXml(formStep4.firstName) }" type="text" title="First Name" required="true" placeholder="First Name" name="firstName" maxlength="50" id="firstName" autofocus="true" aria-required="true" aria-invalid="false">
								</div>
								<div class="inline" id="lastname">
									<label for="last-name" class="label edit">&nbsp;&nbsp; <span class="required">*</span> Last Name </label>
									<input ${readOnly } x-moz-errormessage="Please enter Last Name" value="${fn:escapeXml(formStep4.lastName) }" type="text" title="Last Name" required="true" placeholder="Last Name" name="lastName" maxlength="50" id="lastName" aria-required="true" aria-invalid="false">
								</div>
							</div>
						</div>
						<div class="col-1 margin-bottom">
							<div class="inline" id="address1">
								<label for="address1" class="label edit">&nbsp;&nbsp; <span class="required">*</span> Address </label>
								<input ${readOnly } x-moz-errormessage="Please enter Street Address" value="${fn:escapeXml(formStep4.address1) }" type="text" title="Address" required="true" placeholder="Address" name="homeAddress.address1" maxlength="200" id="address1" aria-required="true" aria-invalid="false">
							</div>
							<div class="inline" id="address2">
								<label for="address2" class="label edit">&nbsp;&nbsp; Apt/Suite </label>
								<input ${readOnly } value="${formStep4.address2 }" type="text" title="Apartment / Suite #" placeholder="Apt/suite" name="homeAddress.address2" maxlength="100" id="address2" aria-invalid="false">
							</div>
						</div>
						<div class="col-1 margin-bottom">
							<div class="inline" id="city">
								<label for="city" class="label edit">&nbsp;&nbsp; <span class="required">*</span> City </label>
								<input ${readOnly } x-moz-errormessage="Please enter City" value="${fn:escapeXml(formStep4.city) }" type="text" title="City" required="true" placeholder="City" name="homeAddress.city" maxlength="50" id="city" aria-required="true" aria-invalid="false">
							</div>
							<div class="inline" id="state">
								<label for="state" class="label edit">&nbsp;&nbsp; <span class="required">*</span> State </label>
								<select ${disableDropDown} ${readOnly } name="homeAddress.state" class="" id="state" title="State" aria-required="true" aria-invalid="false" tabindex="">
									<option value="">--</option>
									<c:forEach var="state" items="${formStep4.states }">
									<option value="${state.key }" <c:if test="${formStep4.state == state.key }">selected="selected"</c:if>>${state.key }</option>
									</c:forEach>
								</select>
							</div>
							<div class="inline" id="zip">
								<label for="zip" class="label edit">&nbsp;&nbsp; <span class="required">*</span> ZIP </label>
								<input ${readOnly } x-moz-errormessage="Please enter Zip Code" value="${fn:escapeXml(formStep4.zipCode) }" type="text" title="ZIP" required="true" placeholder="Zip Code" name="homeAddress.zipCode" maxlength="10" id="zip" aria-required="true" aria-invalid="false">
							</div>
						</div>
					</div>
					<div style=" clear: left; float: left; width: 163px; padding: 0;" class="phones">
						<div class="clearfix margin-bottom">
							<div style=" width: 165px;" class="col-1" id="homephone">
								<label for="home-phone" class="label edit">&nbsp;Home Phone Number </label>
								<input value="${fn:escapeXml(formStep4.homePhone1) }" type="text" title="Home Phone" name="homePhoneArea" maxlength="3" id="home-phone1" aria-invalid="false">
								<span class="hyphen">-</span>
								<input value="${fn:escapeXml(formStep4.homePhone2) }" type="text" title="Home Phone" name="homePhonePrefix" maxlength="3" id="home-phone2" aria-invalid="false">
								<span class="hyphen">-</span><input value="${fn:escapeXml(formStep4.homePhone3) }" type="text" title="Home Phone" name="homePhoneLineNumber" maxlength="4" id="home-phone3" aria-invalid="false">
							</div>
						</div>
						<div class="clearfix margin-bottom">
							<div style=" width: 165px;" class="col-1" id="mobilephone">
								<label for="mobile-phone" class="label edit">&nbsp;Mobile Phone Number </label>
								<input value="${fn:escapeXml(formStep4.cellPhone1) }" type="text" title="Mobile Phone" name="cellPhoneArea" maxlength="3" id="mobile-phone1" aria-invalid="false">
								<span class="hyphen">-</span>
								<input value="${fn:escapeXml(formStep4.cellPhone2) }" type="text" title="Mobile Phone" name="cellPhonePrefix" maxlength="3" id="mobile-phone2" aria-invalid="false">
								<span class="hyphen">-</span>
								<input value="${fn:escapeXml(formStep4.cellPhone3) }" type="text" title="Mobile Phone" name="cellPhoneLineNumber" maxlength="4" id="mobile-phone3" aria-invalid="false">
							</div>
						</div>
						<c:if test="${not formStep4.hideCardlessId }">
						<div class="clearfix margin-bottom" id="cardless">
							<div style=" width: 165px;" class="col-1">
								<label for="alt-id" class="label edit"> Card-less ID </label>
								<input ${readOnly } value="" type="text" title="Alternate Id" name="tempAltIdLineNumber" maxlength="7" id="alt-id1" aria-invalid="false">
								<input ${readOnly } value="" type="text" title="Alternate Id" name="tempAltIdAreaCode" maxlength="4" id="alt-id2" aria-invalid="false">
							</div>
						</div>
						</c:if>
					</div>
					<c:if test="${not formStep4.hideCardlessId }">
					<div id="help-tool-tip" class="card-less-id-help">
						<div id="help-tool-tip-content" class="drop-shadow">
							<h4>What is my Card-less ID?</h4>
							<p>This is a secure number you can use at checkout in place of swiping your card.</p>
							<p class="last"> Please choose an 11 digit number that you can easily remember.
								<br/><br/>
								We recommend you use your 7-digit phone number (without area code) + a 4-digit PIN as your Card-less ID. 
							</p>
						</div>
					</div>
					</c:if>

				</div>
			</div>
		</div>
		<div class="account-edit-actions">
			<input value="3" type="hidden" name="step">
			
			<%-- none,existing,upgrade, or new --%>
			<input value="${formStep4.preferredCardType }" type="hidden" name="preferredCard">
			<%-- if existing or upgrade, the loyalty card numberof the card --%>
			<input value="${fn:escapeXml(formStep4.loyaltyCardNumber) }" type="hidden" name="loyaltyCardNumber">
			<%-- the loyalty card type, again only if its existing or upgrade. --%>
			<input value="${formStep4.loyaltyCardType }" type="hidden" name="loyaltyCardType">
			<%-- the loyalty card program type, again only if its an existing card --%>
			<input value="REWARDS" type="hidden" name="loyaltyCardProgramType">
			<%-- the old alt id, if an upgrade or an existing card --%>
			<input value="${fn:escapeXml(formStep4.loyaltyCardOldAltId) }" type="hidden" name="loyaltyCardOldAltId">
			
			<button type="submit" name="save" id="saveAndContinue" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-step3', 'upgradecard', 'Finish']);">Finish</button>
			<a href="${formStep4.privacyPath }.html" class="privacy-policy right">Privacy Policy</a>
		</div>