<%--

  Promotion component.

  Promotion image and text component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.promotions.Promotion"%><%
	Promotion promotion = new Promotion(pageContext);
	pageContext.setAttribute("promotion",promotion);
%>

<div class="container">
	<div class="container-top"></div>
	<div class="container-inner">
		<img style=" margin-left: 8px; float: left;" src="${promotion.image }" alt="">
		<div style=" width: 537;" class="container-halfbucket">
			<h2>${promotion.headline }</h2>
			<p>${promotion.text }</p>
			<p>
				<span style=" font-size: xx-small;">
					<i>${promotion.finePrint }</i>
				</span>
			</p>
			
			<p>
				<c:if test="${!promotion.button }">
					<cq:include path="ctabutton" resourceType="svubanners/components/general/ctabutton" />
				</c:if>
			</p>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
