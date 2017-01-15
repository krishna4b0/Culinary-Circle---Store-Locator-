<%--

  Beer, Wine & Spirits section component.

  The Beer, Wine & Spirits section component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.BWSSection"%><%
	BWSSection bwsSection = new BWSSection(pageContext);
	pageContext.setAttribute("bwsSection",bwsSection);
%>

<div class="bucket">
		<div class="bucket-left">
			<%bwsSection.getImage().draw(out); %>
		</div>
		<div class="bucket-right">
			<h4>${bwsSection.headline }</h4>
			<p>${bwsSection.text }</p>
			<div class="col-1">
				<c:forEach var="page" items="${bwsSection.firstColumnPages }" >
					<p>
						<a href="${page.key }.html">${page.value }</a>
					</p>
				</c:forEach>
			</div>
			<c:if test="${not empty bwsSection.secondColumnPages }">
				<div class="col-2">
					<c:forEach var="page" items="${bwsSection.secondColumnPages }">
						<p>
							<a href="${page.key }.html">${page.value }</a>
						</p>
					</c:forEach>
				</div>
			</c:if>
			
		</div>
</div>