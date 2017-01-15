<%--

  Healthy Eaters Tour Form component.

  A form to book a tour for healthy eaters

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.HealthyEatersTour"%><%
	HealthyEatersTour healthyEatersTour = new HealthyEatersTour(pageContext);
	pageContext.setAttribute("healthyEatersTour",healthyEatersTour);
%>
<div id="error-message-container" aria-live="assertive" role="alert">
<c:if test="${ not empty healthyEatersTour.errors}">
		<h4>Please correct the following:</h4>
		<ul>
			<c:forEach var="message" items="${healthyEatersTour.errors}">
			<li>${fn:escapeXml(message) }</li>
			</c:forEach>
		</ul>
	</c:if>
</div>

<fieldset>
	<legend>Schedule a Tour</legend>
	<p class="required offset">required *</p>
	
	<p>Choose a Store <span class="required">*</span><br>
		<input value="${fn:escapeXml(healthyEatersTour.storeName) }" type="text" title="Store Address" tabindex="1" name="storeName" id="StoreAddress" class="inp-text" aria-required="true" aria-invalid="false">
		<a href="${healthyEatersTour.findAStoreAction }" class="button-link">Find a Store</a><br>
		<span class="field-help">Ex: 301 Pond Street, Ashland, MA 01721</span>
	</p>
	
	<p>
		<strong>Requested Tour Date/Time</strong>
	</p>
	<div class="float-group clearfix">
		
		<div class="left margin-right">
			<label for="Date">Date<span class="required">*</span></label><br>
			<input id="Date" class="inp-text" type="text" value="${fn:escapeXml(healthyEatersTour.date) }" aria-invalid="false" aria-required="true" name="occurrenceDate" tabindex="2" title="Date: MM/DD/YYYY" value=""><br>
			<span class="field-help">MM/DD/YYYY</span>
		</div>
		
		
		<div class="left">
			<label for="Time">Time<span class="required">*</span></label><br>
			<select id="Time" tabindex="3" title="" name="hour">
				<option value="">Hrs</option>
				<c:forEach var="hours" items="${healthyEatersTour.hoursInstance }">
					<option value="${hours }" <c:if test="${healthyEatersTour.hour == hours }">selected="selected"</c:if>>${hours }</option>
				</c:forEach>
			</select>
			
			<select id="Time" tabindex="3" title="" name="minute">
				<option value="">Mins</option>
				<c:forEach var="minutes" items="${healthyEatersTour.minutesInstance }">
					<option value="${minutes }" <c:if test="${healthyEatersTour.minute == minutes }">selected="selected"</c:if>>${minutes }</option>
				</c:forEach>
			</select>
			
			<select id="Time" tabindex="3" title="" name="timeOfDay">
				<option value="AM" <c:if test="${healthyEatersTour.timeOfDay == 'AM' }">selected="selected"</c:if>>a.m.</option>
				<option value="PM" <c:if test="${healthyEatersTour.timeOfDay == 'PM' }">selected="selected"</c:if>>p.m.</option>
			</select>
		</div>
	</div>
</fieldset>
<hr>
<fieldset>
	<legend>Contact Information</legend>
	<div class="float-group clearfix">
		<div class="left margin-right">
			<label for="FirstName">First Name<span class="required">*</span></label><br>
			<input value="${fn:escapeXml(healthyEatersTour.firstName) }" type="text" title="First Name (required)" tabindex="7" name="firstName" id="FirstName" class="inp-text" aria-required="true" aria-invalid="false">
		</div>
		<div class="left">
			<label for="LastName">Last Name<span class="required">*</span></label><br>
			<input value="${fn:escapeXml(healthyEatersTour.lastName) }" type="text" title="Last Name (required)" tabindex="8" name="lastName" id="LastName" class="inp-text" aria-required="true" aria-invalid="false">
		</div>
	</div>
	
	<div class="float-group">
		<div class="left margin-right">
			<label for="LastName">Grade of Group</label><br>
			<input value="${fn:escapeXml(healthyEatersTour.gradeOfGroup) }" type="text" title="Grade of Group" tabindex="9" name="grade" id="groupGrade" class="inp-text">
		</div>
	
		<div class="float-group clearfix">
			<div class="left margin-right">Number of Students<br>
				<input value="${fn:escapeXml(healthyEatersTour.numberOfStudents) }" type="text" title="Number of Students" tabindex="10" name="numberStudents" id="numberStudents" class="inp-text">
			</div>
			<div class="left">Number of Chaperones<br>
				<input value="${fn:escapeXml(healthyEatersTour.numberOfChaperones) }" type="text" title="Number of Chaperones" tabindex="11" name="numberChaperones" id="numberChaperones" class="inp-text">
			</div>
		</div>
	</div>
	
	<div class="float-group clearfix">
		<label for="WhatHappened">Student Food Allergies/More Information</label><br>
		<textarea title="Student Food Allergies/More Information" name="sComment" id="allergiesInfo" class="inp-textarea" aria-required="false" aria-invalid="false">${fn:escapeXml(healthyEatersTour.studentsAllergies) }</textarea>
	</div>
	
	<p><strong>Contact Method</strong><span class="required">*</span></p>
	<p>I prefer to be contacted via 
		<label for="ContactMethodEmail">Email</label>
		<input value="email" type="radio" title="Email" tabindex="13" name="contactMethod" id="ContactMethodEmail" class="radio-check" <c:if test="${healthyEatersTour.contactMethod == 'email' }">checked="checked"</c:if>>
		<label for="ContactMethodPhone">Phone</label>
		<input value="phone" type="radio" title="Email" tabindex="14" name="contactMethod" id="ContactMethodPhone" class="radio-check" <c:if test="${healthyEatersTour.contactMethod == 'phone' }">checked="checked"</c:if>>
	</p>
	
	<p>
		<label for="Email">Email</label><br>
		<input value="${fn:escapeXml(healthyEatersTour.email) }" type="text" title="Email" tabindex="15" name="email" id="Email" class="inp-text" aria-invalid="false" aria-required="true">
	</p>
	
	<p>
		<label for="PhoneAreaCode">Phone</label><br>
		<input value="${fn:escapeXml(healthyEatersTour.phone1) }" type="text" title="Area Code" tabindex="16" name="phone1" maxlength="3" id="PhoneAreaCode" class="inp-text" aria-invalid="false" aria-required="false">- 
		<input value="${fn:escapeXml(healthyEatersTour.phone2) }" type="text" title="Prefix" tabindex="16" name="phone2" maxlength="3" id="PhonePrefix" class="inp-text" aria-invalid="false" aria-required="false">- 
		<input value="${fn:escapeXml(healthyEatersTour.phone3) }" type="text" title="Suffix" tabindex="17" name="phone3" maxlength="4" id="PhoneSuffix" class="inp-text" aria-invalid="false" aria-required="false">
	</p>
	
	<p>
		<label for="FaxAreaCode">Fax</label><br>
		<input value="${fn:escapeXml(healthyEatersTour.fax1) }" type="text" title="Area Code" tabindex="18" name="fax1" maxlength="3" id="FaxAreaCode" class="inp-text" aria-invalid="false">- 
		<input value="${fn:escapeXml(healthyEatersTour.fax2) }" type="text" title="Prefix" tabindex="19" name="fax2" maxlength="3" id="FaxPrefix" class="inp-text" aria-invalid="false">- 
		<input value="${fn:escapeXml(healthyEatersTour.fax3) }" type="text" title="Suffix" tabindex="20" name="fax3" maxlength="4" id="FaxSuffix" class="inp-text" aria-invalid="false">
	</p>
</fieldset>
<button type="submit" name="submit" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'healthyeaterstour', 'Submit']);">Submit </button>

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
	
	$('#Date').datepicker({
		showOn: 'button',
		buttonImage: '/etc/designs/svubanners/master/images/icn-calendar.gif',
		buttonImageOnly: true
	});
	

	  // Dynamic requirements for contact method
	  $('#ContactMethodEmail').click(function() {
	    $('label[for=Email]').append('<span class="required" id="Email_Required">*</span>');
	    $('#Email').attr('aria-required', 'true');
	    $('#Phone_Required').remove();
	    $('#PhoneAreaCode').attr('aria-required', 'false');
	    $('#PhonePrefix').attr('aria-required', 'false');
	    $('#PhoneSuffix').attr('aria-required', 'false');
	  });

	  $('#ContactMethodPhone').click(function() {
	    $('#Email_Required').remove();
	    $('#Email').attr('aria-required', 'false');
	    $('label[for=PhoneAreaCode]').append('<span class="required" id="Phone_Required">*</span>');
	    $('#PhoneAreaCode').attr('aria-required', 'true');
	    $('#PhonePrefix').attr('aria-required', 'true');
	    $('#PhoneSuffix').attr('aria-required', 'true');
	  });

	  $('#ContactMethodNeither').click(function() {
	    $('#Email_Required').remove();
	    $('#Email').attr('aria-required', 'false');
	    $('#Phone_Required').remove();
	    $('#PhoneAreaCode').attr('aria-required', 'false');
	    $('#PhonePrefix').attr('aria-required', 'false');
	    $('#PhoneSuffix').attr('aria-required', 'false');
	  });

	  $('#ContactMethodEmail').trigger('click');

	  // Bypass the validation if the user finding a store
	  var findStore = false;

	  $('input[name="find"]').click(function() {
	    findStore = true;
	  });

	  $('#frm-adventure').submit(function() {

	    var valid = true;

	    if (!findStore) {

	      aErrors = [];
	      aBadFields = [];

	      $('#error-message-container').empty().hide();

	      if (!$.trim($('#StoreAddress').val()).length) {
	        addErrorMessage('StoreAddress', 'Please select a store.');
	      }

	      var tourDate = $.trim($('#Date').val());

	      if (!tourDate.isDate()) {
	        addErrorMessage('Date', 'Please provide a requested tour date in MM/DD/YYYY format.');
	      }

	      if (!$("select[name='hour']").val().length || !$("select[name='minute']").val().length) {
	        addErrorMessage('Date', 'Please provide a requested tour time.');
	      }

	      if (!$('#FirstName').val().length) {
	        addErrorMessage('FirstName', 'Please provide your first name.');
	      }

	      if (!$('#LastName').val().length) {
	        addErrorMessage('LastName', 'Please provide your last name.');
	      }

	      var numberStudents = $.trim($('#numberStudents').val());

	      if (numberStudents.length && !numberStudents.isInteger()) {
	        addErrorMessage('numberStudents', 'Please enter a number for number of students.');
	      }

	      var numberChaperones = $.trim($('#numberChaperones').val());

	      if (numberChaperones.length && !numberChaperones.isInteger()) {
	        addErrorMessage('numberStudents', 'Please enter a number for number of chaperones.');
	      }

	      if ($('#ContactMethodEmail').is(':checked')) {

	        if (!$('#Email').val().length) {
	          addErrorMessage('Email', 'We will be happy to contact you by email about your tour. Please provide your email address.');
	        }

	      }

	      if ($('#Email').val() && !$('#Email').val().isEmailAddress()) {
	        addErrorMessage('Email', 'Please provide a valid email address.');
	      }

	      if ($('#ContactMethodPhone').is(':checked')) {

	        if (!($('#PhoneAreaCode').val() + '' + $('#PhonePrefix').val() + '' + $('#PhoneSuffix').val()).length) {
	          addErrorMessage(['PhoneAreaCode', 'PhonePrefix', 'PhoneSuffix'], 'We will be happy to contact you by phone about your experience. Please provide your phone number.');
	        }

	      }

	      if (($('#PhoneAreaCode').val() + '' + $('#PhonePrefix').val() + '' + $('#PhoneSuffix').val()).length &&
	          !($('#PhoneAreaCode').val() + '' + $('#PhonePrefix').val() + '' + $('#PhoneSuffix').val()).isPhoneNumber()) {
	            addErrorMessage(['PhoneAreaCode', 'PhonePrefix', 'PhoneSuffix'], 'Please provide a valid phone number.');
	      }

	      if (($('#FaxAreaCode').val() + '' + $('#FaxPrefix').val() + '' + $('#FaxSuffix').val()).length &&
	          !($('#FaxAreaCode').val() + '' + $('#FaxPrefix').val() + '' + $('#FaxSuffix').val()).isPhoneNumber()) {
	            addErrorMessage(['FaxAreaCode', 'FaxPrefix', 'FaxSuffix'], 'Please provide a valid FAX number.');
	      }

	      $('#frm-adventure *[aria-invalid]').attr('aria-invalid', 'false');

	      valid = !aErrors.length;

	      if (!valid) {

	        for(var i = 0; i < aBadFields.length; i++) {
	          $('#' + aBadFields[i]).attr('aria-invalid', 'true');
	        }

	        $('#error-message-container').html('<h4>Please correct the following:</h4><ul><li>' + aErrors.join('</li><li>') + '</li></ul>').show();

	        // Scroll to the top so the user can see the error messages
	        window.scrollTo(0, 0);

	      }

	    }

	    return valid;

	  });

});
</script>