<%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Default body script.

  Draws an empty HTML body.

  ==============================================================================

--%>
<%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false" %>
<div id="wrapper-content">
	<table>
		<tbody>
			<c:forEach var="entry" items="${template.configProperties}">
			<tr>
				<td><b>${entry.key}: </b></td>
				<td>${entry.value}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>