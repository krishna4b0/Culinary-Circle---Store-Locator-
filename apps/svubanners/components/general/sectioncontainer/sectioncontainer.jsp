<%--

  Home Page Section Container Component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.SectionContainer"%><%
	SectionContainer sectionContainer = new SectionContainer(pageContext);
	pageContext.setAttribute("sectionContainer", sectionContainer);
%>

<div id="titledpanel" class="titledpanel">
	<div class="titledpanel_heading">
		<div class="titledpanel_heading_text">
			<h2>${sectionContainer.sectionTitle}</h2>
		</div>
	</div>
	<div class="titledpanel_content">
		<c:forEach var="i" begin="1" end="${sectionContainer.sectionCount}">
			<div class="titledpanel_column titledpanel_column${i}of${sectionContainer.sectionCount}">
				<cq:include path="par-${i}" resourceType="foundation/components/parsys" />
			</div>
		</c:forEach>
	</div>
</div>