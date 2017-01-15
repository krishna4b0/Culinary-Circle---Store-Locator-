<%-- 

The Login Form Component for end-user login.


--%>
<%@include file="/apps/svubanners/global.jsp"%>
<%@ page session="false" import="com.svu.bannersites.cq5.components.account.LoginForm"%>
<%
	LoginForm login = new LoginForm(pageContext);
    pageContext.setAttribute("login", login);
%>
<form method="POST" id="login_form" action="${login.action }" enctype="multipart/form-data">
	<input type="hidden" name="resource" value="<%= xssAPI.encodeForHTMLAttr(login.getRedirect()) %>">
    <input type="hidden" name="_charset_" value="UTF-8"/>
	<div class="account-login-section">
		<div id="error-message-container" aria-live="assertive">
			<c:if test="${not empty login.errorMessages }">
				<h2>Please correct the following:</h2>
				<ul>
				<c:forEach var="message" items="${login.errorMessages}">
					<li>${fn:escapeXml(message) }</li>
				</c:forEach>
				</ul>
			</c:if>
		</div>
		<div class="container">
			<div class="container-top">&nbsp;</div>
			<div class="container-inner">
				<div class="account-section-details clearfix">
					<div id="account-login">
						<h2>Log In</h2>
						<p>
							<label for="userName" class="label">Email Address</label>
							<input value="${fn:escapeXml(login.username)}" type="text" title="Email Address" name="j_username" id="username" aria-required="true">
						</p>
						<p>
							<label for="password" class="label">Password</label>
							<input type="password" title="Password" name="j_password" id="password" aria-required="true">
						</p>
						<p class="no-class">
							<input type="checkbox" title="Remember Me" name="rememberMe" id="remember-me" class="checkbox" checked="checked">
							<label for="remember-me">Remember me on this computer.</label>
						</p>
						<p>
							<button type="submit" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'login', 'Log In']);">Log In</button> &nbsp;&nbsp;
							<a href="${login.forgotPasswordPage}.html">I forgot my password</a>
						</p>
					</div>
					<div id="account-signup">
						<h2>Sign Up</h2>
						${login.signupBenefits }
						<p>
							<cq:include path="signupbutton" resourceType="svubanners/components/general/ctabutton" />
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>