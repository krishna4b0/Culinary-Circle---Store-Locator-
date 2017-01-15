<%--

 Edit My Account Form Component. My Store Section

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormMyStore" %><%
	MyAccountFormMyStore myStore = new MyAccountFormMyStore(pageContext);
	pageContext.setAttribute("myStore", myStore);
%>
	<div class="account-edit-section">
		<h2>My Store</h2>
		<div class="account-edit-section-guts">
			<div class="account-section-details">
				<a href="${myStore.siteroot }/stores/search-stores.html?pageSource=MyAccount" class="edit ss-update-store-myaccount">Edit</a>
				<c:choose>
					<c:when test="${not empty myStore.location }">
					${myStore.location.displayName }
					<br>${myStore.location.address }
					<c:if test="${not empty myStore.location.address2 }">
					<br>${myStore.location.adress2 }
					</c:if>
					<br>${myStore.location.city }, ${myStore.location.state }&nbsp; ${myStore.location.zipCode }
					</c:when>
					<c:otherwise>
					You do not have a selected store!
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
