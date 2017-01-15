<%--

  Homepage Post Card component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.PostCard"%><%
	PostCard postCard = new PostCard(pageContext);
	pageContext.setAttribute("postCard",postCard);
%>
<c:choose>
	<c:when test="${postCard.authorMode }">
		<!-- In author mode, the image selected to author is displayed. The others are hidden -->
		<c:choose>
			<c:when test="${postCard.imageToAuthor==1 }">
			<cq:include path="featureImage-1" resourceType="foundation/components/image" />
			</c:when>
			<c:otherwise>
			<cq:include path="featureImage-${postCard.imageToAuthor }" resourceType="svubanners/components/general/image" />
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<cq:include path="featureImage-1" resourceType="foundation/components/image" />
		<c:if test="${not postCard.noResource}">
		<script type="text/javascript">
			$(document).ready(function(){
				var path = '${postCard.mappedResourcePath}.ajax.html?wcmmode=disabled';
				$.ajax({
					url: path,
					cache: false,
					success: function(data){
						$(data).filter('div.image').each(function(){
							var containedImgs = $(this).find('img');
							if(containedImgs.length==1){
								$('div.featureImage-1').replaceWith($(this));
							}
						});
					},
					dataType: 'html'
				});
			});
		</script>
		</c:if>
	</c:otherwise>
</c:choose>