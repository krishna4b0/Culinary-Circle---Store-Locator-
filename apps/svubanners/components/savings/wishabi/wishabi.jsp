<%--

  Wishabi component.

  
--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" %>
<%@page contentType="text/html; charset=utf-8" import="com.adobe.granite.security.user.UserProperties"%><%
%>
<%
String storeid = null;
com.day.cq.security.profile.Profile profile = null;
if(!com.day.cq.personalization.ProfileUtil.isAnonymous(profile)){
UserProperties props = resourceResolver.adaptTo(UserProperties.class);
storeid = props.getProperty("STORE_ID");
}
%>
<c:set var="userstore" value="<%=storeid%>"/>
<c:choose>
<c:when test = "${cookie.localStoreCookie.value != null}">
<%
if (!properties.get("banner","").equals("")) { 
%>
<div id="circ_div" style="width: 765px;"></div>
<script>
	var getLocalDomain = function () {
		var splitHost = window.location.host.split('.');
		return splitHost[splitHost.length - 2];
	}
	var getWishabiJs = function () {
		return "//circulars." + getLocalDomain() + ".com/hosted_services/js/1.4.0/wishabi.js"
	}
	var getIframeJs = function () {
		return "//circulars." + getLocalDomain() + ".com/hosted_services/iframe.js"
	}
</script>
<script src="" id="wishabiSrc"></script>
<script src="" id="iframeSrc"></script>
<script>
    //var ws = document.createElement('script');
    //var is = document.createElement('script');
    //ws.setAttribute('src',  getWishabiJs());
    //is.setAttribute('src',  getIframeJs());
    //document.head.appendChild(ws);
    //document.head.appendChild(is);
var pageSizing = 'PAGE';
var minHeight = 600;
var initialHeight = 1000;
var extraPadding = 0;

var port = window.location.protocol + '//';
domain = port + 'circulars.' + getLocalDomain() + '.com';

var storeIdQueryString = 'store_code=1920';

var storeId = $.cookie('localStoreCookie');

if (storeId) {
	storeIdQueryString = 'store_code=' + storeId + '&';
}

var queryParameters = storeIdQueryString + 'show_shopping_list_integration=1&show_shopping_list=0';

// var queryParameters = 'postal_code=55408&show_shopping_list_integration=1&show_shopping_list=0';
var flyerId = '';
switch (SVUMaster.banner) {
	case "shopnsave":
		flyerId = "shopnsavesupermarkets"; // This is the only banner with a flyer ID that does not match the domain name
		break;
	case "shoppers":
		flyerId = "shoppers"; // This is the only OTHER banner with a flyer ID that does not match the domain name
		break;
	default:
		flyerId = getLocalDomain();
}
var circ_iframe;
var iframe;
var slOpts;
var shoppingList;
$.getScript(getWishabiJs(), function() {
	$.getScript(getIframeJs(), function() {
	    circ_iframe = new wishabi.hostedservices.iframe.decorate('circ_div', flyerId, 
	        wishabi.hostedservices.iframe.Sizing[pageSizing],
	        {
	            minHeight: minHeight,
	            initialHeight: initialHeight,
	            extraPadding: extraPadding,
	            queryParameters: queryParameters
	    });
	    iframe = document.getElementsByTagName('iframe')[0];
	    
	    slOpts = {
	        handleItemAddedClicked: function(shoppingList, itemId, item) {
	            // Tell the iframe that the item was successfully added.
	    
	            if (item.sku) {
	                if (!$.cookie('login-token') && !$.cookie('promptedForCouponSignin') && !$.cookie('social-login')) {
	                    $.cookie('promptedForCouponSignin', true, {expires: 0.5, path: '/'});
	    
	    
	                    SimpleSignup.app = new SimpleSignup.Signin();
	                    SimpleSignup.app.data.couponClicked = item;
	                    SimpleSignup.app.data.shoppingList = shoppingList;
	                    SimpleSignup.app.data.needsStoreSet = false;
	                    SimpleSignup.app.init();
	    
	    
	                } else if (!$.cookie('rewardsNumberCookie') && !$.cookie('promptedForCardlessIDinput') && $.cookie('login-token') && !$.cookie('loggedInAssociate') || !$.cookie('rewardsNumberCookie') && !$.cookie('promptedForCardlessIDinput') && $.cookie('social-login') && !$.cookie('loggedInAssociate')) {
	                    if (SVUMaster.banner === 'cub') {
	                        SimpleSignup.app = new SimpleSignup.SetAltIDNumber();
	                    } else {
	                        SimpleSignup.app = new SimpleSignup.SetAltIDNumber({isRewards: true});
	                    }
	                    // SimpleSignup.app.data.couponClicked = item;
	                    SVUMaster.wishabi.AddToCard(item, shoppingList);					
	    
	                    SimpleSignup.app.data.shoppingList = shoppingList;
	                    SimpleSignup.app.data.needsStoreSet = false;
	                    SimpleSignup.app.init();
	                } 
	                // else if ($.cookie('rewardsNumberCookie')) {
	                // 	//commenting out for now
	                // 	// SVUMaster.wishabi.AddToCard(item, shoppingList);
	                // } 
	                else {
	                    //no matter what, all situations should 
	                    SVUMaster.wishabi.AddToCard(item, shoppingList);					
	                }
	    
	            } else {
	                SVUMaster.wishabi.AddToList(item, shoppingList);
	            }
	        },
	        handleItemRemovedClicked: function(shoppingList, itemId, item) {
	            // Tell the iframe that the item was successfully removed.
	            if (item.sku) {
	                SVUMaster.deleteEcoupon(item, null, shoppingList);
	            }
	            shoppingList.removeItem(itemId);
	            SVUMaster.wishabi.deleteShoppingListItem(item.name);
	        },
	        handleShoppingListOpen: function(shoppingList) {
	            //console.log('Open Shopping List');
	        }
	    };
	    shoppingList = new wishabi.hostedservices.iframe.ShoppingList(window, iframe.contentWindow, slOpts, domain);
	})
});
</script>
<%
}
else {
%>
<p>Please set banner</p>
<%
}
%>
</c:when>
<c:otherwise>
<p><h2 class="ss-set-store-required">You'll need to <a href="#" class="ss-select-store-modal">set your store</a> before you can view the weekly ad.</h2></p>
</c:otherwise>
</c:choose>