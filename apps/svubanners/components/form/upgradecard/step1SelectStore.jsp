<%--

 Create Account Form Component.
 
 Step 2

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.createaccount.CreateAccountFormStep2" %><%
	CreateAccountFormStep2 formStep2 = new CreateAccountFormStep2(pageContext);
	pageContext.setAttribute("formStep2", formStep2);
%>

		<h3>Find My Store</h3>
		<div class="container">
			<div class="container-top">&nbsp;</div>
			<div class="container-inner clearfix">
				<div style=" padding: 10px 20px 0 20px;" class="form-area">
					<h3 style="margin: 0 0 10px 0;" class="store-confirm">Is this your store?</h3>
					<div class="store-details-box">
						<div style=" padding-bottom: 10px;" class="store-details">
							<p class="no-margin-bottom">${formStep2.activeStore.name }</p>
							<p class="no-margin-bottom">${formStep2.activeStore.address }, ${formStep2.activeStore.address2 }</p>
							<p>${formStep2.activeStore.city }, ${formStep2.activeStore.state }&nbsp;${formStep2.activeStore.zipCode }</p>
							<p class="no-margin-bottom">Store Hours:</p>
							<c:if test="${not empty formStep2.activeStore.groceryHours }">
							<c:forEach var="groceryHour" items="${formStep2.activeStore.groceryHours }">
							<p class="no-margin-bottom">${groceryHour }</p>
							</c:forEach>
							</c:if>
							<p class="no-margin-bottom">${formStep2.activeStore.phone }&nbsp;-&nbsp;Main</p>
						</div>
						<div class="findstore-button-holder">
							<input value="Yes - Continue" name="chooseStoreCurrent" type="submit" tabindex="8" class="button-link findstore-button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-step1', 'upgradecard', 'Yes - Continue']);">
						</div>
					</div>
					<div class="choose-store">
						<a href="${formStep2.siteroot }/stores/search-stores.html?pageSource=UpgradeCard" class="choose-store-nav">No, I'd like to choose a Different Store</a>
					</div>
				</div>
				<input value="1" type="hidden" name="step">
					<br class="clear-all">
				</div>
			</div>
