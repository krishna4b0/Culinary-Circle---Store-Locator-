<%--

Edit My Account Form Component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountForm" %><%
	MyAccountForm myAccount = new MyAccountForm(pageContext);
	pageContext.setAttribute("myAccount", myAccount);
%>
<h1>My Account</h1>
<cq:include script="accountInfo.jsp" />
<cq:include script="password.jsp" />
<cq:include script="contactInfo.jsp" />
<cq:include script="commPrefs.jsp" />
<cq:include script="myStore.jsp" />
<c:if test="${myAccount.storeHasCard or myAccount.isAssociate == true}">
	<cq:include script="preferredCard.jsp" />
</c:if>
<c:if test='${bannerSpecifier != "cub" and myAccount.isAssociate != true}' >
	<cq:include script="rewardsNumber.jsp" />
</c:if>