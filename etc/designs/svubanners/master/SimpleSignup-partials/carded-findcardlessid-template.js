<div class="ss-addrewards-container ss-inner-container ss-alt-container">
	<a href=# class="ss-close-button"></a>
	<h2>Find an account</h2>
	<div class="ss-login-inline-error ss-entry-inline-error">
		<a href=# class="ss-prevent-default"></a>
	</div>
	<p>Complete <span>two</span> of the three fields below to add your card to your account.</p>
	<form id="ss-add-rewards-form">
		<div class="ss-input-container">
			<label for="ss-add-rewards-lastname-input">Last name</label>
			<div class="ss-popup-anchor">
				<input spellcheck="false" type="text" id="ss-add-rewards-lastname-input" data-validation="alphadash">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
		</div>
		<div class="ss-input-container">
			<label for="ss-add-rewards-card-number-input">Card number</label>
			<div class="ss-popup-anchor">
				<input type="text" id="ss-add-rewards-card-number-input" maxlength=11 data-validation="cardnum" data-maxlength-required="true">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
		</div>
		<div class="ss-input-container ss-cardless-split-container">
			<input type="hidden" data-validation="numphone" maxlength=11 data-maxlength-required="true">
			<label for="ss-add-rewards-cardlessid-input">Card-less ID</label>
			<p>This is the 11-digit number you use at checkout in place of swiping your card.</p>
			<div class="ss-popup-anchor">
				<input type="text" class="ss-combined-input placeholder-form-validation" id="ss-add-rewards-cardlessid-input-7" maxlength=7 data-validation="numphone" placeholder="First 7 digits" data-maxlength-required="true">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
			<div class="ss-popup-anchor">
				<input type="text" class="ss-combined-input placeholder-form-validation" id="ss-add-rewards-cardlessid-input-4" maxlength=4 data-validation="numphone" placeholder="PIN" data-maxlength-required="true">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
		</div>
		<button class="ss-submit-button ss-add-rewards-btn ss-submit-button-disabled" type="submit">Continue</button>
	</form>
	<div class="ss-loading-container">
		<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
		<span>Finding your account&hellip;</span>
	</div>
</div>