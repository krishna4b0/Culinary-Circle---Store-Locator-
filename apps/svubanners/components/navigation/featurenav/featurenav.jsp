<%--

  featurenav component.

  

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.FeatureNav"%><%
	FeatureNav featureNav = new FeatureNav(pageContext);
	pageContext.setAttribute("featureNav", featureNav);
	        
%>

<div class="homepanel_column homepanel_column1of2">
	<ul class=options>

     <li class=first><a href="${featureNav.item1Path}" onclick="//_gaq.push(['_trackEvent', 'Homepage', 'LeftNav1', 'WeeklyAd']);">${featureNav.item1Label}</a></li>
     <li class=second><a href="${featureNav.item2Path}" onclick="//_gaq.push(['_trackEvent', 'Homepage', 'LeftNav2', 'Coupons']);">${featureNav.item2Label}</a></li>
     <li class=third><a href="${featureNav.item3Path}" onclick="//_gaq.push(['_trackEvent', 'Homepage', 'LeftNav3', 'BakeryDeliOrdering']);">${featureNav.item3Label}</a></li>
     <li class=fourth>

      <c:choose>
          <c:when test="${fn:toLowerCase(featureNav.item4NoZipcode) == 'true'}">
              <a href="${featureNav.item4Path}" onclick="//_gaq.push(['_trackEvent', 'Homepage', 'LeftNav4', 'BakeryDeliOrdering']);">${featureNav.item4Label}</a>
          </c:when>
          <c:otherwise>
              <form id="frm-findstore" method="get" action="${featureNav.item4Path}" onsubmit="//_gaq.push(['_trackEvent', 'Homepage', 'LeftNav4', 'SearchStores']);">
                  <label for="zipCode" class="visually-hidden">Zipcode</label>
                  <input id="zipCode" onblur="if (!this.value) this.value = this.defaultValue;"  
                  onfocus="if (this.value === this.defaultValue) this.value = ''; else this.select();" 
                  value="Enter ZIP code" 
                  name="zipCode">
                  
                  <label for="radius" class="visually-hidden">Radius</label>
                  <input type="hidden" id="radius" name ="radius" value="10" >
                  <button class="button" type="submit" onclick="//_gaq.push(['_trackEvent', '${currentPage.title }', 'featurenav', 'Submit']);" ></button>
              </form>
          </c:otherwise>
      </c:choose>

	 </li>
   </ul>

	  </li>
    </ul>

 </div>
 
