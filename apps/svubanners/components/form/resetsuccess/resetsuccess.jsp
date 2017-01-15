<%--

 Reset password success

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%>

<div id="ss-page-container" class="ss-page-container ss-page-resetpassword-success">
	<h2>Reset Password</h2>
	<div class="ss-resetpassword-full-container">
		<div class="ss-resetpassword-container ss-inner-container ss-alt-container">
			<p>Your password has been successfully reset. Please <a href="<%=currentPage.getAbsoluteParent(3).getPath() + "/tools/signin.html"%>">signin</a> using your new password.</p>
		</div>
	</div>
</div>