<%--

Reset password 00 component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@ page import="javax.jcr.Session, com.day.cq.wcm.api.WCMMode" %><%
%><%
%>
<div id="ss-page-container" class="ss-page-container ss-page-resetpassword">
	<h2>Reset Password</h2>
	<div class="ss-resetpassword-full-container">
		<div class="ss-resetpassword-container ss-inner-container ss-alt-container">
			<%String error = request.getParameter("error");%>
			<%if(error != null){%>
				<div class="ss-signup-inline-error ss-entry-inline-error">
					<p><%=error%></p>
				</div>
			<%}%>
			<form method="POST" id="ss-page-resetpassword-form" action="/services/resetPassword">
				<label for="ss-password-login">New Password</label>
				<input type="hidden" name="banner_name" value="${bannerSpecifier}">
				<input type="hidden" name="resetkey" value="<%=request.getParameter("key")%>">
				<input type="hidden" name="parentpagepath" value="<%=currentPage.getAbsoluteParent(3).getPath()%>">
				<div class="ss-popup-anchor">
					<input maxlength=20 tabindex=1 type="password" name="newpassword" id="ss-password-login" class="ss-signup-password-input ss-password-input ss-resetpassword-1" data-validation="login" spellcheck="false">
					<div class="ss-password-popup">
						<ul>
							<li class="ss-password-validate-characters">6-20 characters long</li>
							<li class="ss-password-validate-types">Use letters, numbers, underscore, period or &amp;</li>
						</ul>
					</div>
				</div>
				<label for="ss-resetpassword-input2">Verify New Password</label>
				<div class="ss-popup-anchor">
					<input type="password" class="ss-resetpassword-2" data-validation="matchesfieldspassword" name="verifynewpassword" id="ss-resetpassword-input2" maxlength=20 tabindex=2>
					<p class="ss-invalid-email-popup ss-popup-box"></p>
				</div>
				<button class="ss-submit-button ss-submit-button-disabled" type="submit">Submit</button>
				<div class="ss-loading-container">
					<img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif" alt="loading" />
					<span>Changing your password...</span>
				</div>
			</form>
		</div>
	</div>
</div>