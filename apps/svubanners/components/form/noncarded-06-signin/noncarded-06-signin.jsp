<%--

  
Noncarded 06 Signin component
  

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@ page import="javax.jcr.Session, com.day.cq.wcm.api.WCMMode" %><%
%><%
%>
<div id="ss-page-container" class="ss-page-container ss-page-signin">
	<c:choose>
	<c:when test="${bannerSpecifier == 'cub'}">
	<%String bannerName = "Cub";%>
	<h2>My <span class="ss-banner-name"><%=bannerName%></span> Account Log In</h2>
	</c:when>
	<c:when test="${bannerSpecifier == 'farmfresh'}">
	<%String bannerName = "FarmFresh";%>
	<h2>My <span class="ss-banner-name"><%=bannerName%></span> Account Log In</h2>
	</c:when>
	<c:when test="${bannerSpecifier == 'shopnsave'}">
	<%String bannerName = "Shop 'n Save";%>
	<h2>My <span class="ss-banner-name"><%=bannerName%></span> Account Log In</h2>
	</c:when> 
	<c:when test="${bannerSpecifier == 'shoppers'}">
	<%String bannerName = "Shoppers";%>
	<h2>My <span class="ss-banner-name"><%=bannerName%></span> Account Log In</h2>
	</c:when>
	<c:when test="${bannerSpecifier == 'hornbachers'}">
	<%String bannerName = "Hornbacher's";%>
	<h2>My <span class="ss-banner-name"><%=bannerName%></span> Account Log In</h2>
	</c:when>
	<c:when test="${bannerSpecifier == 'rainbowfoods'}">
	<%String bannerName = "Rainbow Foods";%>
	<h2>My <span class="ss-banner-name"><%=bannerName%></span> Account Log In</h2>
	</c:when>
	<c:when test="${bannerSpecifier == 'cmwa'}">
	<%String bannerName = "County Market";%>
	<h2>My <span class="ss-banner-name"><%=bannerName%></span> Account Log In</h2>
	</c:when> 
	</c:choose>
	<div class="ss-signin-full-container">
		<div class="ss-login-container ss-inner-container ss-alt-container ss-page-inner-container">
			<div class="ss-login-full-signin">
				<h3>Sign in</h3>

				<!-- will need to be removed/adjusted as social gets put in for non carded banners -->

				<c:if test="${isSocial}">

				<div class="ss-clear ss-social-component">
					<a href="#" class="ss-facebook-link" title="Sign in with Facebook"></a>
				</div>
				<h3 class="ss-or-h3 ss-social-component">&mdash; or &mdash;</h3>

				</c:if>

				<%String error = request.getParameter("error");%>
				<%if(error != null){%>
					<div class="ss-signup-inline-error ss-entry-inline-error">
						<p><%=error%></p>
					</div>
				<%}%>
				<form method="POST" id="ss-login-form" action="/services/login?parentpagepath=<%=currentPage.getAbsoluteParent(3).getPath()%>">
					<label for="ss-email-input">Username or email address</label>
					<div class="ss-popup-anchor">
						<input spellcheck="false" class="ss-email-input ss-validation-email" id="ss-email-input" data-validation="linkaccount" name="j_username">
						<p class="ss-invalid-email-popup ss-popup-box"></p>
					</div>
					<label class="ss-toggle-pass" for="ss-toggle-visible-password">Show</label>
					<input class="ss-toggle-pass" type="checkbox" id="ss-toggle-visible-password">
					<label class="ss-password-label" for="ss-password-login">Password</label>
					<input spellcheck="false" data-validation="anyinput" type="password" id="ss-password-login" class="ss-password-login-input ss-password-input ss-autofill" name="j_password">
					<div class="ss-checkbox-container">
						<input class="ss-remember" type="checkbox" id="ss-remember-login" name="rememberMe">
						<label class="ss-remember" for="ss-remember-login">Remember me on this computer</label>
					</div>
					<input type="hidden" name="associate" value="false">
					<c:choose>
						<c:when test="${bannerSpecifier == 'cub'}">
							<input type="hidden" name="banner_id" value="7">
						</c:when>
						<c:when test="${bannerSpecifier == 'farmfresh'}">
							<input type="hidden" name="banner_id" value="8">
						</c:when>
						<c:when test="${bannerSpecifier == 'shopnsave'}">
							<input type="hidden" name="banner_id" value="11">
						</c:when>
						<c:when test="${bannerSpecifier == 'shoppers'}">
							<input type="hidden" name="banner_id" value="12">
						</c:when>
						<c:when test="${bannerSpecifier == 'hornbachers'}">
							<input type="hidden" name="banner_id" value="9">
						</c:when>
						<c:when test="${bannerSpecifier == 'rainbowfoods'}">
							<input type="hidden" name="banner_id" value="17">
						</c:when>
						<c:when test="${bannerSpecifier == 'cmwa'}">
							<input type="hidden" name="banner_id" value="18">
						</c:when>
					</c:choose> 
					<div class="ss-clear">
						<button class="ss-submit-button ss-login-btn ss-submit-button-disabled" type="submit">Sign in</button>
						<div class="ss-loading-container">
							<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif" alt="loading" />
							<span>Signing in...</span>
						</div>
						<a class="ss-forgot-password" href="#">I forgot my password</a>
					</div>
				</form>
			</div>
			<h3>Sign Up</h3>
			<p><strong>Why Sign Up for an Online Account?</strong></p>
			<ul>
				<li>Enjoy quick trips to the store by creating an online Shopping List.</li>
				<li>Save even more with coupons and weekly ad savings that you can add to your Shopping List</li>
			</ul>
			<a href="<%=currentPage.getAbsoluteParent(3).getPath() + "/tools/signup.html"%>" tabindex=7>get started</a>
		</div>
	</div>
</div>