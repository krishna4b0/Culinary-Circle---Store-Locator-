<%--

 Replace Card Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.ReplaceCard"%><%
    ReplaceCard replaceCard = new ReplaceCard(pageContext);
    pageContext.setAttribute("replaceCard",replaceCard);
%>
<div>
    <h1 class="replace-card">Replace Lost Card</h1>
    <div class="container replacecard">
        <div role="alert" id="error-message-container" aria-live="assertive">
        <c:if test="${ not empty replaceCard.errors}">
            <h2>Please correct the following:</h2>
            <ul>
                <c:forEach var="message" items="${replaceCard.errors}">
                <li>${fn:escapeXml(message) }</li>
                </c:forEach>
            </ul>
        </c:if>
        </div>
		<script src="/etc/designs/svubanners/master/qas/js/qas.js"></script>
        <div class="container-top">&nbsp;</div>
        <div id="replace-card-wrapper" class="container-inner clearfix">
        <cq:include path="card-image" resourceType="foundation/components/image" />
            <div class="account-edit-section-guts">
                <div class="contact-section-details">
                    <p>Enter the address where you would like to receive your card:</p>
                        <input value="replacement" type="hidden" name="preferredCard">
                        <input value="loyalty" type="hidden" name="loyaltyProgram">
                        <div class="clearfix">
                            <div class="col-1">
                                <div class="inline">
                                    <span class="required"><label class="label edit">&nbsp;*</label></span>
                                    <label class="label edit" for="firstName"> First Name </label>
                                    <input
                                        value="${fn:escapeXml(replaceCard.userFirstName) }" type="text" title="First Name"
                                        style="width: auto; margin-right: 10px;" name="firstName"
                                        maxlength="50" id="firstName" class="value"
                                        aria-required="true">
                                </div>
                                <div class="inline">
                                    <span class="required"><label class="label edit">&nbsp;*</label></span>
                                    <label class="label edit" for="lastName">Last Name </label><input
                                        value="${fn:escapeXml(replaceCard.userLastName) }" type="text" title="Last Name"
                                        style="width:auto;" name="lastName" maxlength="50"
                                        id="lastName" class="value" aria-required="true">
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                            <div class="col-1">
                                <div class="inline">
                                    <span class="required"><label class="label edit">&nbsp;*</label></span>
                                    <label class="label edit" for="address1">Address </label><input
                                        value="${fn:escapeXml(replaceCard.userAddress1) }" type="text"
                                        title="Street Address/P.O. Box" name="homeAddress.address1"
                                        maxlength="200" id="address1" class="value"
                                        aria-required="true">
                                </div>
                                <div class="inline">
                                    <label class="label edit" for="address2">&nbsp;Apt/Suite </label>
                                    <input
                                        value="${fn:escapeXml(replaceCard.userAddress2) }" type="text" title="Apartment/Suite #"
                                        name="homeAddress.address2" maxlength="100" id="address2"
                                        class="value">
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                            <div class="col-1">
                                <div class="inline">
                                    <span class="required"><label class="label edit">&nbsp;*</label></span>
                                    <label class="label edit" for="city">City </label><input
                                        value="${fn:escapeXml(replaceCard.userCity) }" type="text" title="City"
                                        name="homeAddress.city" maxlength="50" id="city" class="value"
                                        aria-required="true">
                                </div>
                                <div class="inline">
                                    <div class="state">
                                        <span class="required"><label class="label edit">&nbsp;*</label></span>
                                        <label class="label edit" for="state">State </label> <select
                                            name="homeAddress.state" class="" id="state" title="State"
                                            aria-required="true" aria-invalid="false" tabindex="">
                                            <option value="">--</option>
                                            <c:forEach var="state" items="${replaceCard.statesInstance }">
                                            <option value="${state.key }" <c:if test="${replaceCard.userState==state.key }">selected="selected"</c:if>>${state.key }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="inline">
                                    <span class="required"><label class="label edit">&nbsp;*</label></span>
                                    <label class="label edit" for="zip">Zip Code </label><input value="${fn:escapeXml(replaceCard.userZipCode) }"
                                        type="text" title="ZIP" name="homeAddress.zipCode"
                                        maxlength="10" id="zip" class="value" aria-required="true">
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                            <div class="col-1">
                                <button value="save" id="saveAndContinue" type="submit" name="save" class="button save" onclick="try {//_gaq.push(['_trackEvent', '${currentPage.title }', 'replacecard', 'Save'])} catch (e) {}; return QAS_Verify();">Save</button>
                                <input value="${removeCard.viewAccountPath }" type="hidden" name="viewAccountPath">
                                <input value="${currentPage.path }" type="hidden" name="resource">
                                <a href="${replaceCard.viewAccountPath }.html" class="cancel" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'replacecard', 'Cancel']);">Cancel</a>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
    $("form").submit(function() {
        //prevent future submissions
        $(this).submit(function() {
            alert("Please only submit this form once.");
            return false;
        });
        //but allow the first one
        return true;
    });
});
</script>