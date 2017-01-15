<%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.rewards.ShawsPolicyLookUp"%><%
	ShawsPolicyLookUp shawsPolicyLookUp = new ShawsPolicyLookUp(pageContext);
	pageContext.setAttribute("shawsPolicyLookUp",shawsPolicyLookUp);
		
%>

<p>To view our Rewards Card Program Privacy Policy (PDF file, requires Adobe Reader):</p>
<ul>
	<li><a href="${shawsPolicyLookUp.newPolicyPath }">Click here</a> if you enrolled in the Program on or after October 1, 2009</li>
	<li><a href="${shawsPolicyLookUp.oldPolicyPath }">Click here</a> if you enrolled in the Program before October 1, 2009</li>
	<li id="unsure" class="">If you are not sure when you enrolled, enter your 12-digit Rewards Card number below to view the appropriate policy.</li>
</ul>
<div id="lookup" class="" aria-live="polite">
	<form id="lookup-form">
		<p>
			<label for="cardnum">Rewards Card Number:</label>
			<input type="text" name="cardnum" id="cardnum">
			<input value="Lookup policy" type="submit">
		</p>
	</form>
	<p id="before">
		You enrolled in the program before October 1, 2009, so <a href="${shawsPolicyLookUp.oldPolicyPath }">this privacy policy</a> applies to you.
	</p>
	<p id="after">
		You enrolled in the program after October 1, 2009, so <a href="${shawsPolicyLookUp.newPolicyPath }">this privacy policy</a> applies to you.
	</p>
	<p id="error">Please enter a valid Rewards Card number.</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#lookup #before, #lookup #after, #lookup #error').css('display', 'none');

	$('#lookup-form').submit(function() {
		var sInput = $('#lookup-form #cardnum').val();
		var isNum = /^\d+$/.test(sInput);
		
		$('#lookup #before, #lookup #after, #lookup #error').css('display', 'none');
		if(!isNum) {
			$('#error').css('display', 'block');
		} else if(parseInt(sInput) < 42508630141 || (44400000000 <= parseInt(sInput) && parseInt(sInput) <= 444999999999)) {
			$('#before').css('display', 'block');
		} else {
			$('#after').css('display', 'block');
		}
		return false;
	});
});
</script>