<%--

 Edit My Account Form Component. Password Section

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormPassword" %><%
	MyAccountFormPassword accountPw = new MyAccountFormPassword(pageContext);
	pageContext.setAttribute("accountPw", accountPw);
%>
<div class="account-edit-section">
	<h2>Account Password</h2>
	<div class="account-edit-section-guts">
		<div class="account-section-details">
			<a href="#" class="edit ss-myaccount-changepassword">Change Password</a> ********
		</div>
	</div>
</div>