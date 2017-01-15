<%--

  FAQ component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.Faq"%><%
	Faq faq = new Faq(pageContext);
	pageContext.setAttribute("faq",faq);
%>
<h3 class="question"><span>Q: ${faq.question }</span></h3>
<div class="answer">
${faq.answer }
</div>