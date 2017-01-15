<%--
  Copyright 1997-2009 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Albertsons Market overlay component (AlbertsonsMarketOverlay)

  Displays an overlay (fancybox) that asks the user if s/he would like to go
  to the Albertsons Market site. It then sets a cookie to prevent the overlay
  from being shown again.

--%><%

%>

<%@ page import="com.svu.bannersites.cq5.components.general.Text" session="false" %>
<%@include file="/apps/svubanners/global.jsp"%>
<%
  Text textComp = new Text(pageContext);
  pageContext.setAttribute("textComp",textComp);
%>

<c:choose>
  <c:when test="${textComp.authorMode}">
      <div id="ABSMarketOverlayPlaceholder">[AlbertsonsMarketOverlay Component]</div>
  </c:when>
  <c:otherwise>
    <div id="ABSMarketOverlayContainer" style="display: none;">
      <div id="ABSMarketOverlay">
        <h3>Are you looking for an</h3>
        <h3>Alberstons Market store in <span id="llcStateName"></span>?</h3>
        <div id="ABSMarketOverlayLogo">
          <img src="/etc/designs/svubanners/albertsons/img/ABSMarketLogo-301x68.png" height="68" width="301" alt="Albersons Market Logo" />
          <a class="button ABSMarketOverlay-Yes" href="http://www.albertsonsmarket.com">Yes! Take me to the web site, please</a>
        </div>
        <a class="ABSMarketOverlay-No" href="#">No, I'm in the right place</a>
      </div>
    </div>

    <script type="text/javascript">
      $(document).ready(function() {
      
        var llcStates = "AR,AZ,CO,LA,FL,TX";                        
        var storeState = "${template.storeState}";
        
        if (storeState.length > 0 && llcStates.indexOf(storeState) > -1) {
          invokeABSMarketOverlay(stateNameFromAbbrev(storeState));
        }
        
      });

      function invokeABSMarketOverlay(stateName) {
        var cookieExpiration = 1000;
        var cookieName = "GoToAlbertsonsMarket";
        var cookieValue = $.cookie(cookieName);
        
        $("#llcStateName").text(stateName);

        if (cookieValue === null ) {
          try {
              $.fancybox({
                  content: $("#ABSMarketOverlayContainer").html(),
                  onClosed: function() {
                      // Reveals Fancybox shadow elements.
                      $('[id^="fancy-bg-"]').css({'visibility': 'visible'});
                  },
                  onComplete: function() {
                      $(".ABSMarketOverlay-Yes").click(function(e) {
                          e.preventDefault();
                          $.cookie(cookieName, "true", {expires : cookieExpiration , path: "/"});
                          $.fancybox.close();
                          window.location.href = $(this).attr("href");
                          return false;
                      });

                      $(".ABSMarketOverlay-No").click(function(e) {
                          e.preventDefault();
                          $.cookie(cookieName, "false", {expires : cookieExpiration , path: "/"});
                          $.fancybox.close();
                          return false;
                      });
                  },
                  onStart: function () {
                      // Conceals Fancybox shadow elements.
                      $('[id^="fancy-bg-"]').css({'visibility': 'hidden'});
                  }
              }).trigger("click");
          } catch(errorData) {
              //do nothing
          };
        }
        else {
          // Cookie found, now what?
        }
      }     
    </script>
  </c:otherwise>
</c:choose>
