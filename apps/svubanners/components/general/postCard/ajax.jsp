<%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.PostCard"%><%
	PostCard postCard = new PostCard(pageContext);
	pageContext.setAttribute("postCard",postCard);
%>
<c:forEach var="i" begin="2" end="${postCard.images }" >
	<cq:include path="featureImage-${i }" resourceType="svubanners/components/general/image" />
</c:forEach>