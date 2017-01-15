<div class="ss-addrewards-container ss-inner-container ss-alt-container">
	<a href=# class="ss-close-button"></a>
	<h2>Add Rewards Card</h2>
	<div class="ss-login-inline-error ss-entry-inline-error">
		<a href=# class="ss-prevent-default"></a>
	</div>
	<p>Complete <span>two</span> of the three fields below to add your card to your account.</p>
	<form id="ss-add-rewards-form">
		<div class="ss-input-container">
			<label for="ss-add-rewards-lastname-input">Last name</label>
			<div class="ss-popup-anchor">
				<input spellcheck="false" id="ss-add-rewards-lastname-input" data-validation="alphadash">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
		</div>
		<div class="ss-input-container">
			<label for="ss-add-rewards-card-number-input">
				<% if ( !ssTemplate.isAssociate ) { %>
				Rewards
				<% } %>
				Card Number</label>
			<div class="ss-popup-anchor">
				<input id="ss-add-rewards-card-number-input" maxlength=11 data-validation="cardnum" data-maxlength-required="true">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
		</div>
		<% if ( ssTemplate.isAssociate ) { %>
		<label for="ss-add-rewards-associateid-input">Associate ID</label>
		<div class="ss-popup-anchor">
			<input type="text" id="ss-add-rewards-associateid" maxlength=10 data-validation="anyinput" spellcheck="false">
			<p class="ss-invalid-email-popup ss-popup-box"></p>
		</div>
		<% } else { %>
		<div class="ss-input-container ss-cardless-split-container">
			<input type="hidden" data-validation="numphone" maxlength=11 data-maxlength-required="true" class="ss-combined-hidden-input">
			<label for="ss-add-rewards-cardlessid-input">Card-less ID</label>
			<p>This is the 11-digit number you use at checkout in place of swiping your card.</p>
			<div class="ss-popup-anchor">
				<input class="ss-combined-input placeholder-form-validation" id="ss-add-rewards-cardlessid-input-7" maxlength=7 data-validation="numphone" placeholder="First 7 digits" data-maxlength-required="true">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
			<div class="ss-popup-anchor">
				<input class="ss-combined-input placeholder-form-validation" id="ss-add-rewards-cardlessid-input-4" maxlength=4 data-validation="numphone" placeholder="PIN" data-maxlength-required="true">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
		</div>
		<% } %>
		<button class="ss-submit-button ss-add-rewards-btn ss-submit-button-disabled" type="submit">Continue</button>
	</form>
	<div class="ss-loading-container">
		<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
		<% if ( ssTemplate.isAssociate ) { %>
		<span>Finding your account&hellip;</span>
		<% } else { %>
		<span>Finding your card&hellip;</span>
		<% } %>
	</div>
</div>