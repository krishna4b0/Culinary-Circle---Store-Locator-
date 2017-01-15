<div class="ss-updatepassword-container ss-inner-container ss-alt-container">
	<a href=# class="ss-close-button"></a>
	<h2>Change password</h2>
	<div class="ss-login-inline-error ss-entry-inline-error">
		<a href=# class="ss-prevent-default"></a>
	</div>
	<form>
		<div class="ss-updatepassword-input-container">
			<label for="ss-old-password">Old password</label>
			<input id="ss-old-password" type="password" maxlength=20 data-validation="anyinput" tabindex=1 class="ss-updatepassword-old ss-password-input" spellcheck="false">
		</div>
		<div class="ss-updatepassword-input-container">
			<label for="ss-password-login">New password</label>
			<div class="ss-popup-anchor">
				<input maxlength=20 tabindex=1 type="password" id="ss-password-login" class="ss-signup-password-input ss-password-input ss-resetpassword-1" data-validation="login" spellcheck="false">
				<div class="ss-password-popup">
					<ul>
						<li class="ss-password-validate-characters">6-20 characters long</li>
						<li class="ss-password-validate-types">Use letters, numbers, underscore, period or &amp;</li>
					</ul>
				</div>
			</div>
			<label for="ss-resetpassword-input2">Re-enter new password</label>
			<div class="ss-popup-anchor">
				<input type="password" class="ss-resetpassword-2 ss-password-input" spellcheck="false" data-validation="matchesfieldspassword" name="verifynewpassword" id="ss-resetpassword-input2" maxlength=20 tabindex=2>
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
		</div>
		<div class="ss-toggle-pass-container">
			<input tabindex=3 class="ss-toggle-pass" type="checkbox" id="ss-toggle-visible-password">
			<label class="ss-toggle-pass" for="ss-toggle-visible-password">Show</label>
		</div>
		<button class="ss-submit-button ss-submit-button-disabled" type="submit">Save</button>
		<div class="ss-loading-container">
			<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
			<span>Updating your profile&hellip;</span>
		</div>
	</form>
</div>
