<%--

  Preferred Rewards Teaser Component component.

  This component is to be used inside of the home page section container component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.rewards.RewardsTeaser"%><%
	RewardsTeaser rewardsTeaser = new RewardsTeaser(pageContext);
	pageContext.setAttribute("rewardsTeaser",rewardsTeaser);
		
%>
<div class="image savingsCard"></div>
<div class="rewards-teaser-widget">
	<h3>${rewardsTeaser.savingsHeadline }</h3>
	<p>${rewardsTeaser.savingsDescription }</p>
	<a onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'rewardsteaser', 'Sign Up!']);" href="${rewardsTeaser.savingsLink }.html" class="button">Sign Up!</a>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var path = '${rewardsTeaser.mappedResourcePath}';
	
	$.ajax({
	  url: path + '.ajax.html',
	  cache: false,
	  success: function(data){
		  $('div.rewardsteaser').html(data);
	  },
	  dataType: 'html'
	});
});
</script>