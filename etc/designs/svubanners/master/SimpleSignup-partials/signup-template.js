<% if ( ssTemplate.isAssociate ) { %>

<div class="ss-signup-container ss-inner-container ss-associatesignup-container ss-alt-container">
	<a href=# class="ss-close-button"></a>
	<h2>Sign up</h2>
	<div class="ss-signup-content-container">

		<% if ( ssTemplate.isSocial ) { %>

		<h3 class="ss-social-component">Sign up with</h3>	
		<div class="ss-clear ss-social-component">
			<a href="#" class="ss-facebook-link" title="Sign up with Facebook"></a>
		</div>
		<h3 class="ss-or-h3 ss-social-component">&mdash; or &mdash;</h3>

		<% } %>

		<div class="ss-signup-inline-error ss-entry-inline-error">
			<p></p>
		</div>	
		<form id="ss-signup-form">
			<input type="password" style="display: none;"> <!-- disables chrome autofill -->
			<label for="ss-email-input">Email address</label>
			<div class="ss-popup-anchor">
				<input spellcheck="false" tabindex=1 type="text" class="ss-email-input ss-validation-email" id="ss-email-input" data-validation="email" maxlength=100>
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
			<label class="ss-toggle-pass" for="ss-toggle-visible-password">Show</label>
			<input tabindex=3 class="ss-toggle-pass" type="checkbox" id="ss-toggle-visible-password">
			<label class="ss-password-label" for="ss-password-login">Password</label>
			<div class="ss-popup-anchor">
				<input maxlength=20 tabindex=2 type="password" id="ss-password-login" class="ss-signup-password-input ss-password-input ss-autofill" data-validation="login">
				<div class="ss-password-popup">
					<ul>
						<li class="ss-password-validate-characters">6-20 characters long</li>
						<li class="ss-password-validate-types">Use letters, numbers, underscore, period or &amp;</li>
					</ul>
				</div>
			</div>
			<div class="ss-checkbox-container">
				<input tabindex=4 class="ss-remember" type="checkbox" id="ss-remember-login">
				<label class="ss-remember" for="ss-remember-login">Remember me on this computer</label>
			</div>
			<div class="ss-clear">
				<button tabindex=5 class="ss-submit-button ss-create-associate-account-btn ss-submit-button-disabled" type="submit">Continue</button>
				<div class="ss-loading-container">
					<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
					<span>Creating your account&hellip;</span>
				</div>
			</div>
		</form>
	</div>
	<div class="ss-associate-info-container ss-popup-anchor">
		<h3>Already have an online account?</h3>
		<p>Add your associate card to your account to save even more with coupons and weekly ad savings.</p>
		<a href="#" class="ss-getstarted-button">get started</a>
	</div>
</div>

<% } else { %>

<div class="ss-signup-container ss-inner-container ss-alt-container">
	<a href=# class="ss-close-button"></a>
	<h2>Sign up</h2>

	<% if ( ssTemplate.isSocial ) { %>

	<h3 class="ss-social-component">Sign up with</h3>	
	<div class="ss-clear ss-social-component">
		<a href="#" class="ss-facebook-link" title="Sign up with Facebook"></a>
	</div>
	<h3 class="ss-or-h3 ss-social-component">&mdash; or &mdash;</h3>

	<% } %>

	<div class="ss-signup-inline-error ss-entry-inline-error">
		<p></p>
	</div>	
	<form id="ss-signup-form">
		<input type="password" style="display: none;"> <!-- disables chrome autofill -->
		<label for="ss-email-input">Email address</label>
		<div class="ss-popup-anchor">
			<input spellcheck="false" tabindex=1 type="text" class="ss-email-input ss-validation-email" id="ss-email-input" data-validation="email" maxlength=100>
			<p class="ss-invalid-email-popup ss-popup-box"></p>
		</div>
		<label class="ss-toggle-pass" for="ss-toggle-visible-password">Show</label>
		<input tabindex=3 class="ss-toggle-pass" type="checkbox" id="ss-toggle-visible-password">
		<label class="ss-password-label" for="ss-password-login">Password</label>
		<div class="ss-popup-anchor">
			<input maxlength=20 tabindex=2 type="password" id="ss-password-login" class="ss-signup-password-input ss-password-input" data-validation="login" spellcheck="false">
			<div class="ss-password-popup">
				<ul>
					<li class="ss-password-validate-characters">6-20 characters long</li>
					<li class="ss-password-validate-types">Use letters, numbers, underscore, period or &amp;</li>
				</ul>
			</div>
		</div>
		<div class="ss-checkbox-container">
			<input tabindex=4 class="ss-remember" type="checkbox" id="ss-remember-login">
			<label class="ss-remember" for="ss-remember-login">Remember me on this computer</label>
		</div>
		<div class="ss-clear ss-popup-anchor">
			<button tabindex=5 class="ss-submit-button ss-create-account-btn ss-submit-button-disabled" type="submit">Continue</button>
			<div class="ss-loading-container">
				<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
				<span>Creating your account&hellip;</span>
			</div>
		</div>
		<p class="ss-have-account-prompt">Have an account? <a tabindex=6 href="#">Sign in!</a></p>
	</form>
</div>

<% } %>