<div class="ss-login-container ss-inner-container ss-alt-container">
	<a href=# class="ss-close-button"></a>
	<h2>Sign in</h2>

	<% if ( ssTemplate.isSocial ) { %>

	<h3 class="ss-social-component">Sign in with</h3>
	<div class="ss-clear ss-social-component">
		<a href="#" class="ss-facebook-link" title="Sign in with Facebook"></a>
	</div>
	<h3 class="ss-or-h3 ss-social-component">&mdash; or &mdash;</h3>

	<% } %>

	<div class="ss-login-inline-error ss-entry-inline-error">
		<p></p>
	</div>
	<form id="ss-login-form">
		<label for="ss-email-input">Username or email address</label>
		<div class="ss-popup-anchor">
			<input spellcheck="false" tabindex=1 class="ss-email-input ss-validation-email" id="ss-email-input" data-validation="linkaccount">
			<p class="ss-invalid-email-popup ss-popup-box"></p>
		</div>
		<label class="ss-toggle-pass" for="ss-toggle-visible-password">Show</label>
		<input tabindex=3 class="ss-toggle-pass" type="checkbox" id="ss-toggle-visible-password">
		<label class="ss-password-label" for="ss-password-login">Password</label>
		<input tabindex=2 data-validation="anyinput" type="password" id="ss-password-login" class="ss-password-login-input ss-password-input" spellcheck="false">
		<div class="ss-checkbox-container">
			<input tabindex=4 class="ss-remember" type="checkbox" id="ss-remember-login">
			<label class="ss-remember" for="ss-remember-login">Remember me on this computer</label>
		</div>
		<div class="ss-clear">
			<button tabindex=5 class="ss-submit-button ss-login-btn ss-submit-button-disabled" type="submit">Sign in</button>
			<div class="ss-loading-container">
				<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
				<span>Signing in&hellip;</span>
			</div>
			<a tabindex=6 href=# class="ss-forgot-password">I forgot my password</a>
		</div>
		<p class="ss-need-account-prompt">Need an account? <a tabindex=7 href="#">Sign up!</a></p>
	</form>
</div>