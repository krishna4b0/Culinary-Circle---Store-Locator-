<div class="ss-legalTerms-container ss-inner-container ss-alt-container">
	<a href=# class="ss-close-button"></a>
	<div>
		<div class="ss-coupon-name">
			<p><%= ssTemplate.couponName %></p>
		</div>

		<div class="ss-coupon-image">
			<img width="80" alt="<%= ssTemplate.couponName %>" src="<%= ssTemplate.couponImg %>">
		</div>

		<div class="ss-coupon-description">
			<p><%= ssTemplate.couponDescription %></p>

			<p class="ss-coupon-date">
				<%= ssTemplate.couponDate %>
			</p>

		</div>
		<div class="ss-coupon-terms">
		<% if (ssTemplate.couponTerms) { %>
		  <p><%= ssTemplate.couponTerms %></p>
		<% } else { %>
			<p>The terms could not be loaded at this time. Please try again later.</p>
		<% } %>            
		</div>
</div>
