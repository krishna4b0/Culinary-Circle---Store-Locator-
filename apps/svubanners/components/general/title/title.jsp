<%--

  Title Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.Title"%><%
	Title title = new Title(pageContext);
	pageContext.setAttribute("title",title);
%>
<c:choose>
	<c:when test="${title.link != '' }">
		<a href="${title.link }">
			<${title.size } class="${title.displayClass }" <c:if test="${title.image != null }">style="background-image: url('${title.image}');"</c:if>>${title.title }</${title.size}>
		</a>
	</c:when>
	<c:otherwise>
		<${title.size } class="${title.displayClass }" <c:if test="${title.image != null }">style="background-image: url('${title.image}');"</c:if>>${title.title }</${title.size}>
	</c:otherwise>
</c:choose>
