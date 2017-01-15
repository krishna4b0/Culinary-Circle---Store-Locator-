<%--

  Circular Item Search Form component.

  This component will display a form to be used for searching circular items by keyword and/or categories.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.savings.CircularItemSearchForm"%><%
	CircularItemSearchForm circularItemSearchForm = new CircularItemSearchForm(pageContext);
	pageContext.setAttribute("circularItemSearchForm", circularItemSearchForm);
%>

<div class="container tabbed">
	<div class="container-top">&nbsp;</div>
	<h1><span>Weekly Ad Specials</span></h1>
	<div id="coupons-filter">
		<div class="container-inner clearfix">
			<div class="filter-col-1">
				<form action="${circularItemSearchFrom.resultsPath }">
					<fieldset>
						<label class="searchLabel" for="keyword">Search Specials</label>
						<div style="margin-bottom: 1em;">
							<input type="text" id="keyword" name="keyword" value="${fn:escapeXml(circularItemSearchForm.keyword)}">
						</div>
						<input type="hidden" name="storeId" value="${fn:escapeXml(circularItemSearchForm.storeId)}">
						<input type="hidden" name="circularId" value="${fn:escapeXml(circularItemSearchForm.circularId) }">
						<input type="hidden" name="sneakPeek" value="${fn:escapeXml(circularItemSearchForm.sneakPeek) }">
						<button value="Search" type="submit" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-keyword', 'circularsearchform', 'Search']);">Search</button>
					</fieldset>
				</form>
			</div>
			
			<div class="clearfix">
				<div class="filter-col-2">
					<form action="${circularItemSearchFrom.resultsPath }">
						<fieldset>						
							<label class="searchLabel" for="category">Filter Specials by Category</label>
							<div style="margin-bottom: 1em;">
								<select name="category" id="category">			
									<option value="">---- Select ----</option>		
									<c:forEach var="category" items="${circularItemSearchForm.categories }">
										<option value="${category.key }" <c:if test="${circularItemSearchForm.category==category.key }">selected="selected"</c:if>>${category.value }</option>
									</c:forEach>
								</select>
							</div>
							<input type="hidden" name="storeId" value="${fn:escapeXml(circularItemSearchForm.storeId)}">
							<input type="hidden" name="circularId" value="${fn:escapeXml(circularItemSearchForm.circularId)}">
							<input type="hidden" name="sneakPeek" value="${fn:escapeXml(circularItemSearchForm.sneakPeek)}">
							<button value="Search" type="submit" class="button" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }-category', 'circularsearchform', 'Search']);">Search</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>