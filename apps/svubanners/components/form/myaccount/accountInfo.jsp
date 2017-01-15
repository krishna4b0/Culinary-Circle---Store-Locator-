<%--

 Edit My Account Form Component. Account Info Section

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormAccountInfo" %><%
	MyAccountFormAccountInfo accountInfo = new MyAccountFormAccountInfo(pageContext);
	pageContext.setAttribute("accountInfo", accountInfo);
%>
<div class="account-edit-section">
	<h2>Account Information</h2>
	<div class="account-edit-section-guts">
		<div class="account-section-details acct-info">
			<div class="clearfix">
				<div class="col-1">
					<div class="label">Signed in as</div>
					<div class="value personal">${fn:escapeXml(accountInfo.userEmail) }</div>
				</div>
			</div>
		</div>
	</div>
</div>