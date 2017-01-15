<%--

  Hero Component

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.Hero"%><%
    Hero hero = new Hero(pageContext);
    pageContext.setAttribute("hero",hero);
%>
<div class="container-top">&nbsp;</div>
<c:if test="${hero.tab }">
<h1><span>${hero.tabTitle}</span></h1>
</c:if>
<div class="container-inner">
    <div <c:if test="${hero.image != null }">style="background: transparent url('${hero.image}') 0 0 no-repeat;height:${hero.height}px"</c:if> class="hero-body">
		<c:choose>
		  <c:when test="${hero.whiteBox}">
			 <div class="textField whiteBox">
		  </c:when>
		  <c:otherwise>
			 <div class="textField">
		  </c:otherwise>
		</c:choose>		
		        <c:if test="${not empty hero.headline }">
	    	    <h2>${hero.headline }</h2>
	        	</c:if>
	        	${hero.text}
	       	</div>
    </div>
</div>