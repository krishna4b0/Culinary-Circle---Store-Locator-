<%--

  The Suggested Shopping List Container Item

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.SuggestedListContainerItem"%><%
	SuggestedListContainerItem slci = new SuggestedListContainerItem(pageContext);
	pageContext.setAttribute("slci", slci);
%>
<tr>
	<td scope="row">&nbsp;</td>
	<td class="sl-qty">
		<input value="${slci.quantityText }" type="text" name="shoppingListItems[${slci.index }].quantityText" maxlength="3" id="qty-${slci.index }" class="inp-qty">
	</td>
	<td class="sl-itemname">
		<input value="${slci.name }" type="checkbox" name="shoppingListItems[${slci.index }].itemText" id="name-${slci.index }" class="checkbox">&nbsp;${slci.name }
	</td>
	<td class="sl-stop">&nbsp;</td>
</tr>