<%--

  Titled Widget Component

--%>
<%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.TitledWidget"%><%
    TitledWidget widget = new TitledWidget(pageContext);
	pageContext.setAttribute("widget",widget);
%>
<h3>${widget.title }</h3>
<div class="widget-feature-inner" <c:if test="${widget.center}">style="text-align: center;"</c:if>>
<cq:include path="widgetpar" resourceType="foundation/components/parsys" />
</div>