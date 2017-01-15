<%--

 Create Account Form Component.
 
 Step 3

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.createaccount.CreateAccountFormStep3" %><%
	CreateAccountFormStep3 formStep3 = new CreateAccountFormStep3(pageContext);
	pageContext.setAttribute("formStep3", formStep3);
%>
<div class="container">
	<div class="container-top">&nbsp;</div>
	<div class="container-inner">
		<div id="preferred-card-selection">
		<div class="card-img-discount"></div>
			<div class="container-halfbucket">
				<ul style="margin: 0 10px 0 8px;" id="preferred-card-options">
						<li>
				 		<p>Do you have a Preferred Savings Card?</p>
						<input value="existing" type="radio" title="Add my existing preferred card number." name="preferredCard" id="card-replacement" class="radio">
						<strong>
							<label for="card-replacement">Yes</label>
						</strong>
						<div id="option-preferred-card-replacement" class="preferred-card-option-details clearfix" style="display: none; ">
							<div class="input-col">
								<div class="margin-bottom">
									<label for="card-number">&nbsp;
	           									<strong>Last Name</strong>
	           								</label>
	           								<br>
	           								<input value="${formStep3.lastName }" type="text" title="Last Name" name="lastName" maxlength="50" id="lastName" aria-required="true">
	           							</div>
	           							<div class="margin-bottom">
	            							<label for="card-number">&nbsp;
	            								<strong>Card Number</strong>
	            							</label>
	            							<br>
	            							<input value="${formStep3.cardNumber }" type="text" title="Preferred Card Number" name="loyaltyCardNumber" maxlength="12" id="card-number" aria-required="true">
	           							</div>
	           							<c:if test="${not formStep3.hideCardlessId }">
	           							<div class="margin-bottom">
	           								<label for="card-phone">&nbsp;
	           									<strong>Card-less ID</strong>
	           								</label>
	           								<br>
	           								<span class="details">This is the number you use at checkout in place of swiping your card.</span>
	           								<br>
	           								<input value="" type="text" title="Phone" name="alternateId" maxlength="10" id="card-phone" aria-required="true">
	           							</div>
	           							</c:if>
	           						</div>
	           						<div style="margin-left: 290px;" class="two-three-req">
	           							&nbsp;
	     							</div>
	     							</div>
	     						</li>
	     					</ul>
	     				</div>
	     				<div style=" height: 2px;" class="clearfix">&nbsp;</div>
	     			</div>
	     		</div>
	     	</div>
	  		<div class="account-edit-actions">
		<p>
			<input value="2" type="hidden" name="step">
			<input value="${formStep3.loyaltyProgramType }" type="hidden" name="loyaltyProgramType">
			<button type="submit" tabindex="7" name="nextStep" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-step2', 'upgradecard', 'Save and Continue']);">Save and Continue</button>
		</p>
		<p class="next">
			<strong>Next:</strong> Contact information
		</p>
	</div>
	     	<script  type="text/javascript">
	     		$(document).ready(function(){
			
			// show/hide radio button options
			$('#option-preferred-card-replacement').hide();
			
			// show existing card option, hide replacement card option
			$('#card-replacement').bind("click", function() {
				$('#option-preferred-card-replacement').show();		
			});

		});
	     	</script>