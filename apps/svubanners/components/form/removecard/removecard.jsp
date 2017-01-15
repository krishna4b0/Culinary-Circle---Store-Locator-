<%--

 Remove Card Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.RemoveCard"%><%
	RemoveCard removeCard = new RemoveCard(pageContext);
	pageContext.setAttribute("removeCard",removeCard);
%>
<div>
	<h1 class="replace-card">Remove Card</h1>
	<div class="container replacecard">
		<div role="alert" id="error-message-container" aria-live="assertive">
		<c:if test="${ not empty removeCard.errors}">
			<h2>Please correct the following:</h2>
			<ul>
				<c:forEach var="message" items="${removeCard.errors}">
				<li>${fn:escapeXml(message) }</li>
				</c:forEach>
			</ul>
		</c:if>
		</div>
		<div class="container-top">&nbsp;</div>
		<div id="replace-card-wrapper" class="container-inner clearfix">
			<div class="account-edit-section-guts">
				<div class="contact-section-details">
					<h2>Are you sure you want to delete this card?</h2>
					<input value="confirmdeletecard" type="hidden" name="preferredCard">
					<input value="${removeCard.viewAccountPath }" type="hidden" name="viewAccountPath">
					<input value="${currentPage.path }" type="hidden" name="resource">
					<input value="Delete" type="submit" style="width: auto; margin-left: -3px; margin-top: -3px;" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'removecard', 'Delete']);">
					<a href="${removeCard.viewAccountPath }.html" class="cancel" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'removecard', 'Cancel']);">Cancel</a>
					<br>
					<br>
					<br>
					<br>
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