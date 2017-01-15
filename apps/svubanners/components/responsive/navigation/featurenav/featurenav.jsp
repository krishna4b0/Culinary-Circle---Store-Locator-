<%--

  featurenav component. 

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.FeatureNav"%><%
	FeatureNav featureNav = new FeatureNav(pageContext);
	pageContext.setAttribute("featureNav", featureNav);
	        
%>
        
<div class="row">
	<div class="options"> 


	  <div class="button-option first small-12 medium-6 large-12"><a href="${featureNav.item1Path}">${featureNav.item1Label}</a></div>
      <div class="button-option second small-12 medium-6 large-12"><a href="${featureNav.item2Path}">${featureNav.item2Label}</a></div>
      <div class="button-option third small-12 medium-6 large-12"><a href="${featureNav.item3Path}">${featureNav.item3Label}</a></div>
      <div class="button-option fourth small-12 medium-6 large-12">

      <c:choose>
          <c:when test="${fn:toLowerCase(featureNav.item4NoZipcode) == 'true'}">
              <a href="${featureNav.item4Path}">${featureNav.item4Label}</a>
          </c:when>
          <c:otherwise>
              <form id="frm-findstore" method="get" action="${featureNav.item4Path}">
                  <label for="zipcode">Zipcode</label>
                  <input onblur="if (!this.value) this.value = this.defaultValue;" id="zipCode" 
                  onfocus="if (this.value === this.defaultValue) this.value = ''; else this.select();" 
                  value="Enter ZIP code" 
                  name="zipCode">
                  <input type="hidden" id="radius" name ="radius" value="10" >
                  <button class="button" type="submit"></button>
              </form>
          </c:otherwise>
      </c:choose>
	  </div>
	</div>
 </div>
 
