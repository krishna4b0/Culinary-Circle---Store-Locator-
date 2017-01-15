<%--

  Youtube Video Container component.

  A component to feature multiple youtube videos. Clicking on a video will open a fancybox pop up to play the video.

--%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.YoutubeVideoContainer"%><%
    YoutubeVideoContainer youtubeVideoContainer = new YoutubeVideoContainer(pageContext);
	pageContext.setAttribute("youtubeVideoContainer",youtubeVideoContainer);
%>
<a name="video" id="video">&nbsp;</a>
<div id="summer-video">
	<!-- Container Title -->
	<h5>${youtubeVideoContainer.title }</h5>
	
	<!-- Left box -->
	<div class="left-box-video">
		<object height="${youtubeVideoContainer.heigth }" width="${youtubeVideoContainer.width }">
			<param name="movie" value="http://www.youtube.com/v/${youtubeVideoContainer.videoId }">
			<param name="allowFullScreen" value="true">
			<param name="allowscriptaccess" value="sameDomain">
			<param name="wmode" value="transparent">
			<embed allowfullscreen="true" allowscriptaccess="sameDomain" height="${youtubeVideoContainer.heigth }" src="http://www.youtube.com/v/${youtubeVideoContainer.videoId }" type="application/x-shockwave-flash" width="${youtubeVideoContainer.width }" wmode="transparent">
		</object>
	</div>
	
	<!-- Right box -->
	<div class="right-box-video">
		<div class="personnel-profiles-wrapper clearfix" id="section-2">
			<p>${youtubeVideoContainer.description }</p>
			<h5>${youtubeVideoContainer.subtitle }</h5>

			
			<!-- List of videos -->
			<div class="personnel-profiles">
				<c:forEach var="video" items="${youtubeVideoContainer.videosId }" varStatus = "i">
					<c:choose>	
						<c:when test='${(i.index)%2 ne 0}'>
							<div>
						</c:when>
						<c:otherwise>
							<div class="odd">
						</c:otherwise>
					</c:choose>	
						<p>
							<!-- Link to other videos. href = #video-profile-[number] -->
							<a class="popup-opener show" href="#video-profile-${i.count }">${youtubeVideoContainer.videosTitle[i.count-1] }</a>
							
							<!-- Camera image -->
							<img src="http://www.albertsons.com/common/img/summer/camera.png">
						</p>
						
						<!-- Video description -->
						<p>${youtubeVideoContainer.videosDescription[i.count-1] }</p>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- Hidden videos content for fancybox content -->
		<div class="personnel-profile-popups">
			
			<!-- Div id same as href -->
			<c:forEach var="video" items="${youtubeVideoContainer.videosId }" varStatus="i">
				
				<div class="video-popup" id="video-profile-${i.count }">
					<!-- Video title -->
					<h4>${youtubeVideoContainer.videosTitle[i.count-1] }</h4>
					<!-- Video embded -->
					<div class="video">
						<object height="259" width="450">
							<param name="movie" value="http://www.youtube.com/v/${video }">
							<param name="allowFullScreen" value="true">
							<param name="allowscriptaccess" value="sameDomain">
							<embed allowfullscreen="true" allowscriptaccess="sameDomain" height="259" src="http://www.youtube.com/v/${video }" type="application/x-shockwave-flash" width="450">
						</object>
					</div>
					<div class="personnel-profiles">
						<p>Watch all summertime videos:</p>
						<c:forEach var="video" items="${youtubeVideoContainer.videosId }" varStatus = "i">
							<div class="profile-nav">
	  							<a href="#" class="popup-opener show" rel="#video-profile-${i.count}" id="video-${i.count}">${youtubeVideoContainer.videosTitle[i.count-1]}</a>
	 							<img src="http://www.albertsons.com/common/img/summer/blue-camera.png">
	 							<p>${youtubeVideoContainer.videosDescription[i.count-1] }</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- End of right box video -->
	</div>
	<!-- End of summer video -->
</div>



