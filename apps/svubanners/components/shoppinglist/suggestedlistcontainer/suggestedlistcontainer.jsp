<%--

  The Suggested Shopping List Container

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.shoppinglist.SuggestedListContainer,com.day.cq.wcm.api.components.IncludeOptions"%><%
	SuggestedListContainer slc = new SuggestedListContainer(pageContext);
	pageContext.setAttribute("slc", slc);
%>
<c:if test="${not empty slc.items && not slc.authorMode }">
	<%
		IncludeOptions.getOptions(request, true).forceSameContext(true);
	%>
	<table summary="Table displaying a suggested shopping list with ingredients you can add to your shopping list." id="suggested-list" class="sort" cellspacing="0">
		<thead>
			<tr>
				<th scope="col" class="startcap">&nbsp;</th>
				<th scope="col">Qty.</th>
				<th scope="col">Item</th>
				<th scope="col" class="stopcap">&nbsp;</th>
			</tr>
		</thead>
		<tbody id="sortable1">
		<c:forEach var="slci" items="${slc.items }" varStatus="status">
		<tr>
			<td scope="row">&nbsp;</td>
			<td class="sl-qty">
                <label for="qty-${slci.index }" class="visually-hidden">Quantity</label>
				<input value="${slci.quantityText }" type="text" name="itemQtyTxt" maxlength="3" id="qty-${slci.index }" class="inp-qty">
			</td>
			<td class="sl-itemname">
				<c:if test="${not suppressShoppingList }">
				<input id="slc-item-${status.index}" type="checkbox" name="selections" value="${status.index}">
				</c:if>	
				<label for="slc-item-${status.index}">${slci.name }</label>
				<input type="hidden" name="itemTxt" value="${slci.name }" />
				<input type="hidden" name="itemType" value="ENTERED" />
				<input type="hidden" name="itemSource" value="Suggestedlist" />
			</td>
			<td class="sl-stop">&nbsp;</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</c:if>
<c:if test="${slc.editMode }">
	<c:forEach var="item" items="${slc.items }">
		<sling:include resource="${item.resource }"/>
	</c:forEach>
	Drag Suggested List Item(s) below.
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
</c:if>
