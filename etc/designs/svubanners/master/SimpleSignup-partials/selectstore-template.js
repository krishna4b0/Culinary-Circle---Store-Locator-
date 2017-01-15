<div class="ss-storeselect-container ss-inner-container ss-alt-container">
	<a href=# class="ss-close-button"></a>
		<% if (ssTemplate.isRequiredForCoupons) { %>
	<h2>Select a store to view our savings</h2>
		<% } else { %>
	<h2>Select a store</h2>
		<% } %>
	<div class="ss-store-search-input-container">
		<form>
			<div class="ss-popup-anchor">
				<input type="text" data-validation="storezip" spellcheck="false" placeholder="Zip OR city/state" class="ss-storeselect-search-input placeholder-form-validation">
				<p class="ss-invalid-email-popup ss-popup-box"></p>
			</div>
			<button type="submit" class="ss-submit-button ss-storeselect-search-button ss-submit-button-disabled">Search</button>
		</form>
		<div class="ss-loading-container">
			<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
			<span>Searching for closest stores...</span>
		</div>
	</div>
	<div class="ss-entry-inline-error">
		<a href=# class="ss-prevent-default"></a>
	</div>
	<section class="ss-map-info-container">
		<div id="ss-store-maps-container">
		</div>
		<button type="submit" class="ss-submit-button">Use this store</button>
		<div class="ss-loading-container">
			<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
			<span>Saving your store&hellip;</span>
		</div>
	</section>
</div>