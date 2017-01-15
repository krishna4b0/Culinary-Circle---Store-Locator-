<%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.AddToCard"%><%
	AddToCard addToCard = new AddToCard(pageContext);
	pageContext.setAttribute("addToCard", addToCard);
%>




<div class="container">
	<div class="message">
		<h2>Thank You!</h2>
	</div>
	<div class="bodyCopy">
		
		<span class="checkmarkIcon"></span><p>eCoupon has successfully been saved to your account!</p>
	</div>
</div>

