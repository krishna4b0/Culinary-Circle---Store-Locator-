<div class="ss-signupoverlay-container ss-inner-container ss-alt-container<% if (ssTemplate.isMyAccount) { %> ss-myaccount-contactinfo-container<% } %>">
	<a href=# class="ss-close-button"></a>
	<h2><% if (ssTemplate.isConfirm) { %>
		Confirm your contact information
		<% } else if (ssTemplate.isMyAccount) { %>
		Update your contact information
		<% } else { %>
		Contact information
		<% } %>
	</h2>
	<form id="ss-signupoverlay-form" class="ss-popup-anchor">
		<div class="ss-signup-input-container ss-signup-firstname-container ss-popup-anchor">
			<label for="ss-signup-firstname"><span>* </span>First name</label>
			<input spellcheck="false" id="ss-signup-firstname" data-validation="firstname">
			<p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>
		</div>

		<div class="ss-signup-input-container ss-signup-lastname-container ss-popup-anchor">
			<label for="ss-signup-lastname"><span>* </span>Last name</label>
			<input spellcheck="false" id="ss-signup-lastname" data-validation="alphadash">
			<p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>
		</div>

		<div class="ss-signup-inline-error ss-entry-inline-error">
			<a href=# class="ss-prevent-default"></a>
		</div>

		<div class="ss-signup-input-container ss-signup-address-container ss-popup-anchor">
			<label for="address1"><span>* </span>Address</label>
			<input spellcheck="false" id="address1" data-validation="address">
			<p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>						
		</div>

		<div class="ss-signup-input-container ss-signup-apt-container ss-popup-anchor">
			<label for="address2">Apt/Suite</label>
			<input spellcheck="false" class="ss-validation-not-required" data-validation="address" id="address2">			
			<p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>						
		</div>

		<div class="ss-signup-input-container ss-signup-city-container ss-popup-anchor">
			<label for="city"><span>* </span>City</label>
			<input spellcheck="false" id="city" data-validation="city">
			<p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>							
		</div>

		<div class="ss-signup-input-container ss-signup-state-container">
			<label for="state"><span>* </span>State</label>
			<select id="state" data-validation="alpha">
				<option name=""></option>
				<option name="AL">AL</option>
				<option name="AK">AK</option>
				<option name="AZ">AZ</option>
				<option name="AR">AR</option>
				<option name="CA">CA</option>
				<option name="CO">CO</option>
				<option name="CT">CT</option>
				<option name="DE">DE</option>
				<option name="DC">DC</option>
				<option name="FL">FL</option>
				<option name="GA">GA</option>
				<option name="HI">HI</option>
				<option name="ID">ID</option>
				<option name="IL">IL</option>
				<option name="IN">IN</option>
				<option name="IA">IA</option>
				<option name="KS">KS</option>
				<option name="KY">KY</option>
				<option name="LA">LA</option>
				<option name="ME">ME</option>
				<option name="MD">MD</option>
				<option name="MA">MA</option>
				<option name="MI">MI</option>
				<option name="MN">MN</option>
				<option name="MS">MS</option>
				<option name="MO">MO</option>
				<option name="MT">MT</option>
				<option name="NE">NE</option>
				<option name="NV">NV</option>
				<option name="NH">NH</option>
				<option name="NJ">NJ</option>
				<option name="NM">NM</option>
				<option name="NY">NY</option>
				<option name="NC">NC</option>
				<option name="ND">ND</option>
				<option name="OH">OH</option>
				<option name="OK">OK</option>
				<option name="OR">OR</option>
				<option name="PA">PA</option>
				<option name="RI">RI</option>
				<option name="SC">SC</option>
				<option name="SD">SD</option>
				<option name="TN">TN</option>
				<option name="TX">TX</option>
				<option name="UT">UT</option>
				<option name="VT">VT</option>
				<option name="VA">VA</option>
				<option name="WA">WV</option>
				<option name="WI">WI</option>
				<option name="WY">WY</option>
			</select>
		</div>

		<div class="ss-signup-input-container ss-signup-zipcode-container ss-popup-anchor">
			<label for="zip"><span>* </span>Zip code</label>
			<input id="zip" maxlength=5 data-validation="zip" data-maxlength-required="true">
			<p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>	
		</div>

		<div class="ss-signup-input-container ss-signup-phones-container ss-homephone-container">
			<input type="hidden" class="ss-combined-input ss-signup-homephone-combined ss-validation-not-required" data-validation="numphone" maxlength=10 data-maxlength-required="true">
			<label class="ss-popup-anchor"><p>Home phone number</p>
				<div class="ss-popup-anchor">
					<input class="ss-phone-number-3 ss-validation-not-required" id="ss-signup-homephone-1" maxlength=3 data-maxlength-required="true" data-validation="numphone">
					<p class="ss-invalid-email-popup ss-popup-box"></p>
				</div>
				<span>-</span>
				<div class="ss-popup-anchor">
					<input class="ss-phone-number-3 ss-validation-not-required" id="ss-signup-homephone-2" maxlength=3 data-maxlength-required="true" data-validation="numphone">
					<p class="ss-invalid-email-popup ss-popup-box"></p>
				</div>
				<span>-</span>
				<div class="ss-popup-anchor">
					<input class="ss-phone-number-4 ss-validation-not-required" id="ss-signup-homephone-3" maxlength=4 data-maxlength-required="true" data-validation="numphone">
					<p class="ss-invalid-email-popup ss-popup-box"></p>
				</div>
			</label>
		</div>

		<div class="ss-signup-input-container ss-signup-phones-container ss-mobilephone-container">
			<input type="hidden" class="ss-combined-input ss-signup-mobilephone-combined ss-validation-not-required" data-validation="numphone" maxlength=10 data-maxlength-required="true">
			<label><p>Mobile phone number</p>
				<div class="ss-popup-anchor">
					<input class="ss-phone-number-3 ss-validation-not-required" id="ss-signup-mobilephone-1" maxlength=3 data-maxlength-required="true" data-validation="numphone">
					<p class="ss-invalid-email-popup ss-popup-box"></p>
				</div>
				<span>-</span>
				<div class="ss-popup-anchor">
					<input class="ss-phone-number-3 ss-validation-not-required" id="ss-signup-mobilephone-2" maxlength=3 data-maxlength-required="true" data-validation="numphone">
					<p class="ss-invalid-email-popup ss-popup-box"></p>
				</div>
				<span>-</span>
				<div class="ss-popup-anchor">
					<input class="ss-phone-number-4 ss-validation-not-required" id="ss-signup-mobilephone-3" maxlength=4 data-maxlength-required="true" data-validation="numphone">
					<p class="ss-invalid-email-popup ss-popup-box"></p>
				</div>
			</label>
		</div>
		<% if (!ssTemplate.isMyAccount) { %>
		<div class="ss-signup-input-container ss-signup-cardless-container ss-popup-anchor">
			<input type="hidden" class="ss-combined-input ss-signup-cardlessid-combined ss-validation-not-required" data-validation="numphone" maxlength=11 data-maxlength-required="true">
			<label><p>Card-less ID</p>
				<input data-maxlength-required="true" id="ss-signup-cardlessid-1" class="ss-validation-7num ss-validation-not-required" maxlength=7 data-validation="numphone">
				<p class="ss-invalid-email-popup ss-popup-box ss-popup-cardless"></p>
				<input data-maxlength-required="true" id="ss-signup-cardlessid-2" maxlength=4 class="ss-cardless-4 ss-validation-4num ss-validation-not-required" data-validation="numphone">
				<p class="ss-invalid-email-popup ss-popup-box ss-popup-cardless"></p>
			</label>
			<div class="ss-signup-cardlessinfo">
				<h2>What is my Card-less ID?</h2>
				<p>This is a secure number you can use at checkout in place of swiping your card.</p>
				<p>We recommend using your 7-digit phone number (without area code) + a 4-digit PIN as your Card-less ID.</p>
			</div>
		</div>
		<% } %>
		<button class="ss-submit-button ss-signup-btn ss-submit-button-disabled" type="submit">Continue</button>
		<a href="/about/security-privacy.html" target="_blank">Privacy policy</a>
	</form>
	<div class="ss-loading-container">
		<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
		<span>Saving your contact information&hellip;</span>
	</div>
</div>