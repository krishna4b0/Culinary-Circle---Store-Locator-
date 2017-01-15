<%--

  Personnel Profile Container component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.PersonnelProfileContainer,
								com.svu.bannersites.cq5.components.general.PersonnelProfileItem,
								com.day.cq.wcm.api.components.IncludeOptions,
								java.util.List"%><%
	PersonnelProfileContainer personnelProfileContainer = new PersonnelProfileContainer(pageContext);
	pageContext.setAttribute("personnelprofilecontainer",personnelProfileContainer);
%>

<div class="personnel-profiles-wrapper clearfix">
	<h4>${personnelprofilecontainer.title }</h4>
	<c:if test="${not empty personnelprofilecontainer.profiles && not personnelprofilecontainer.authorMode }">
		<div class="personnel-profiles">
		<c:forEach var="profile" items="${personnelprofilecontainer.profiles }">
		<div>
			<%
			PersonnelProfileItem profile = (PersonnelProfileItem)pageContext.findAttribute("profile");
			profile.getImage().draw(out);
			%>
			<div>
				<h5>${profile.name } | ${profile.location }</h5>
				<p>${profile.teaser }<br />
				<a href="#personnel-profile-${profile.id }" class="popup-opener">READ THE FULL INTERVIEW</a>
			</div>
		</div>
		</c:forEach>
		</div>
	</c:if>
</div>
<c:choose>
	<c:when test="${ personnelprofilecontainer.authorMode}">
<div class="personnel-profile-popups-off">
	</c:when>
	<c:otherwise>
<div class="personnel-profile-popups">
	</c:otherwise>
</c:choose>

<c:if test="${not empty personnelprofilecontainer.profiles }">
<%
	List<PersonnelProfileItem> profiles = personnelProfileContainer.getProfiles();
	PersonnelProfileItem previous = null;
	PersonnelProfileItem next = null;
	PersonnelProfileItem current = null;
	for(int i=0;i<profiles.size();i++) {
	    current = profiles.get(i);
	    if(i+1<profiles.size()) {
	        next = profiles.get(i+1);
	    } 
	    %>
	    <div id ="personnel-profile-<%=current.getId() %>">
	    <sling:include resource="<%=current.getResource() %>"/>
	    
	    <div class="profile-nav">
	    <%
	    if(previous!=null) {
	    %><a rel="#personnel-profile-<%=previous.getId() %>" href="#" class="left">PREV: <%=previous.getName() %></a><%
	    }
	    if(next!=null) {
	    %><a rel="#personnel-profile-<%=next.getId() %>" href="#" class="right">NEXT: <%=next.getName() %></a><% 
	    }
	    %>
	    </div>
	    </div>
	    <%
	    previous = current;
	    next=null;
	}
%>
</c:if>
</div>

<c:if test="${personnelProfileContainer.editMode }">
	${personnelProfileContainer.parsysTitle }
</c:if>
<%
	if(editContext != null){
	    log.debug("edit context is not null.");
	    String newType= resource.getResourceType() + "/new";
	    editContext.setAttribute("currentResource",null);
	    // draw the "new" bar
	    IncludeOptions.getOptions(request,true).getCssClassNames().add("section");
	    IncludeOptions.getOptions(request,true).getCssClassNames().add(component.getCellName());
	    %><cq:include path="*" resourceType="<%=newType %>"/><%
	} else {
	    log.debug("edit context is null.");
	}
%>