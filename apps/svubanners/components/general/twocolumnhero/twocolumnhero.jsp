<%--

  Hero Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.TwoColumnHero"%><%
    TwoColumnHero twoColumnHero = new TwoColumnHero(pageContext);
    pageContext.setAttribute("twoColumnHero",twoColumnHero);
%>
<div class="container-top">&nbsp;</div>
<c:if test="${twoColumnHero.tab }">
<h1><span>${twoColumnHero.tabTitle}</span></h1>
</c:if>
<c:set var="defaultHeight" value="220" />
<div class="container-inner" style="height: 
	<c:choose>
		<c:when test="${empty twoColumnHero.sizeHeight}" >
			${defaultHeight}px;
		</c:when>
		<c:otherwise>
			${twoColumnHero.sizeHeight}px;
		</c:otherwise>
	</c:choose>">

    <div class="imageColumn" style="float: ${twoColumnHero.floatChoice}; height: 	
    <c:choose>
		<c:when test="${empty twoColumnHero.sizeHeight}" >
			${defaultHeight}px;
		</c:when>
		<c:otherwise>
			${twoColumnHero.sizeHeight}px;
		</c:otherwise>
	</c:choose>">
   	<c:choose>
    	<c:when test="${twoColumnHero.assignLink != ''}">
    		<a href="${twoColumnHero.assignLink}.html">
				<cq:include path="image" resourceType="foundation/components/image" />
    		</a>
    	</c:when>
    	<c:otherwise>
				<cq:include path="image" resourceType="foundation/components/image" />
    	</c:otherwise>
   	</c:choose>
    
    </div>
    <div class="hero-body">
        <c:if test="${not empty twoColumnHero.headline }">
            <h2>${twoColumnHero.headline }</h2>
        </c:if>
        ${twoColumnHero.text}
    </div>
</div>
