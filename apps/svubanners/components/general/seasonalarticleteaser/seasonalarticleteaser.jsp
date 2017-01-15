<%--

  Seasonal Article Teaser component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.SeasonalArticleTeaser"%><%
	SeasonalArticleTeaser articleTeaser = new SeasonalArticleTeaser(pageContext);
    pageContext.setAttribute("articleTeaser", articleTeaser);
%>
<div class="clear-bar">&nbsp;</div>
<div class="recipe-box">
	<div class="recipe-image">
		<% articleTeaser.getImage().draw(out); %>
	</div>
	<div class="recipe-title">
		<span>${articleTeaser.title }</span>
	</div>
	<div class="recipe-summary">
		<p class="description">
			${articleTeaser.description }
			<br>
			<a title="Read more" href="${articleTeaser.teaserPath }.html">READ ARTICLE &gt;</a>
		</p>
	</div>
</div>
<c:if test="${articleTeaser.authorMode }">
<div class="clearfix">&nbsp;</div>
</c:if>