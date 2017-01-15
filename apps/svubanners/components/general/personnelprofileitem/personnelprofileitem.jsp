<%--

  Full Personnel Profiles component.


--%>

<%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.PersonnelProfileItem"%><%
	PersonnelProfileItem personnelProfileItem = new PersonnelProfileItem(pageContext);
	pageContext.setAttribute("personnelProfileItem",personnelProfileItem);
%>

<h5>${personnelProfileItem.name } | ${personnelProfileItem.location }</h5>
<%personnelProfileItem.getImage().draw(out); %>
<div>${personnelProfileItem.profileBody}</div>


