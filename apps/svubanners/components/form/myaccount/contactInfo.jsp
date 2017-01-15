<%--

 Edit My Account Form Component. Contact Info Section

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormContactInfo" %><%
	MyAccountFormContactInfo contactInfo = new MyAccountFormContactInfo(pageContext);
	pageContext.setAttribute("contactInfo", contactInfo);
%>

<div class="account-edit-section">
	<h2>Contact Information</h2>
	<div class="account-edit-section-guts">
		<div class="account-section-details">
			<a href="#" class="edit ss-myaccount-editcontactinfo ss-isNotAssociate">Edit</a>
			<div class="clearfix">
				<div class="col-1">
					<div class="label">Address</div>
					<div class="value personal">
						${fn:escapeXml(contactInfo.userFirstName) }&nbsp;${fn:escapeXml(contactInfo.userLastName) }<br> 
						${fn:escapeXml(contactInfo.userAddress) }<br>
						<c:if test="${not empty contactInfo.userAddress2 }">
						${fn:escapeXml(contactInfo.userAddress2) }<br>
						</c:if>
						${fn:escapeXml(contactInfo.userCity) }<c:if test="${not empty contactInfo.userCity }">,</c:if>&nbsp;${fn:escapeXml(contactInfo.userState) }&nbsp;${fn:escapeXml(contactInfo.userZipCode) }
					</div>
				</div>
				<div class="col-2">
					<div class="label">Home Phone Number</div>
					<div id="userHomePhone" class="value personal">${fn:escapeXml(contactInfo.userHomePhone) }</div>
					<div class="label">Mobile Phone Number</div>
					<div class="value personal">${fn:escapeXml(contactInfo.userMobilePhone) }</div>
				</div>
			</div>
		</div>
		<p class="ss-isAssociate">Associate contact information can be updated through MIO or your HR system.</p>
	</div>
</div>