<%--

  YouTube Video Component

--%>
<%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.YouTubeVideo"%><%
    YouTubeVideo youTubeVideo = new YouTubeVideo(pageContext);
	pageContext.setAttribute("youTubeVideo",youTubeVideo);
%>
<c:choose>
	<c:when test="${empty youTubeVideo.videoId && youTubeVideo.authorMode}">
		<cq:include script="empty.jsp"/>
	</c:when>
	<c:otherwise>
	<div>
	<c:if test="${not empty youTubeVideo.title}">
		<h2>${youTubeVideo.title}</h2>
	</c:if>
	<div>
		 <object height="${youTubeVideo.height}" width="${youTubeVideo.width}" wmode="opaque">
			<param name="movie" value="https://www.youtube.com/v/${youTubeVideo.videoId}?fs=1&rel=${youTubeVideo.displayRelatedVideos}">
			<param name="allowFullScreen" value="true">
			<param name="wmode" value="opaque">
			<param name="allowscriptaccess" value="sameDomain">
			<embed height="${youTubeVideo.height}" width="${youTubeVideo.width}" src="https://www.youtube.com/v/${youTubeVideo.videoId}?wmode=opaque&fs=1&rel=${youTubeVideo.displayRelatedVideos}" type="application/x-shockwave-flash" wmode="opaque">
		</object> 
	</div>
	<c:if test="${not empty youTubeVideo.videoDescription }">
		<p>${youTubeVideo.videoDescription}</p>
	</c:if>
</div>
	</c:otherwise>
</c:choose>