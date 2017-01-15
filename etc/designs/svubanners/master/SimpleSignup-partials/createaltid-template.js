<div class="ss-createrewards-container <% if (!ssTemplate.isRewards) { %>ss-addcardlessid-container<% } %> ss-inner-container ss-alt-container">
	<a href="#" data-later="true" class="ss-close-button"></a>
	<h2>
		<% if (!ssTemplate.isRewards) {
			if (ssTemplate.isUpdating) { %>
				Update <% } else { %>
				Add <% } %>
		Card-less ID
		<% } else {
			if (ssTemplate.isUpdating) { %>
				Update <% } else { %>
				Create <% } %>
		Rewards Number
		<% } %>
	</h2>
	<div class="ss-login-inline-error ss-entry-inline-error">
		<a href="#" class="ss-prevent-default"></a>
	</div>
	<form id="ss-create-rewards-form">
		<div class="ss-altid-inuse-message-upper">
			<p>The 
					<% if (!ssTemplate.isRewards) { %>
					Card-less ID 
					<% } else { %>
					Rewards Number 
					<% } %>
					you entered is already in use on another account.
			</p>
			<p>Please enter a new 
				<% if (!ssTemplate.isRewards) { %>
					Card-less ID.
					<% } else { %>
					Rewards Number.
				<% } %>
			</p>
		</div>

		<p class="ss-altid-description">By creating a <% if (!ssTemplate.isRewards) { %>card-less ID<% } else { %>Rewards Number<% } %>, you will be able to redeem your offers at the register 
			<% if (!ssTemplate.isRewards) { %>
				even if you forget your card!
			<% } else { %>
				even if you forget your phone!
			<% } %>
		</p>

		<p class="ss-altid-description">Your <% if (!ssTemplate.isRewards) { %>card-less ID<% } else { %>Rewards Number<% } %>
		is <% if (!ssTemplate.isRewards) { %>an 11<% } else { %>a 10<% } %>-digit number. <br> <strong>We recommend using your phone number<% if (!ssTemplate.isRewards) { %> and a 4-digit PIN<% } %>.</strong></p>

		<% if (!ssTemplate.isRewards) { %>
		<label for="ss-rewards-input">Card-less ID</label>
		<input type="hidden" data-maxlength-required="true" class="ss-createcardlessid-combined ss-combined-hidden-input" data-validation="numphone" maxlength=11 data-maxlength-required="true">
		<div class="ss-popup-anchor">
			<input data-maxlength-required="true" maxlength=7 placeholder="First 7 digits" type="text" class="ss-cardless1-input ss-combined-input" data-validation="numphone">
			<p class="ss-invalid-email-popup ss-popup-box"></p>
		</div>
		<div class="ss-popup-anchor ss-cardless-4">
			<input data-maxlength-required="true" maxlength=4 type="text" placeholder="PIN" class="ss-combined-input ss-cardless2-input" data-validation="numphone">
			<p class="ss-invalid-email-popup ss-popup-box"></p>
		</div>
		<% } else { %>
		<label for="ss-rewards-input">Rewards Number</label>
		<div class="ss-popup-anchor">
			<input maxlength=10 type="text" class="ss-rewards-input" data-validation="rewardsnum" data-maxlength-required="true">
			<p class="ss-invalid-email-popup ss-popup-box"></p>
		</div>
		<% } %>
		<button class="ss-submit-button ss-submit-button-disabled" type="submit">Continue</button>
		<div class="ss-loading-container">
			<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
			<% if (!ssTemplate.isRewards) { %>
			<span>Adding your Card-less ID&hellip;</span>
			<% } else { %>
			<span>Adding your Rewards Number&hellip;</span>
			<% } %>
		</div>
		<a href="#" class="ss-not-now">Not now</button>
		<div class="ss-altid-inuse-message-lower">
			<p><strong>Does the other account belong to you?</strong></p>
			<p>If you know the account information, you can <a href="#">combine your accounts.</a></p>
		</div>		
	</form>
</div>