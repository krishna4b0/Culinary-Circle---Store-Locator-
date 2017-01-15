<%--

Social Login Component
--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%>
<%@ page import="javax.jcr.Session, com.day.cq.wcm.api.WCMMode" %>
<%@page contentType="text/html; charset=utf-8" import="org.apache.sling.api.resource.Resource,
                                                       org.apache.sling.commons.json.JSONObject,
                                                       com.day.cq.i18n.I18n,
                                                       com.day.cq.personalization.ProfileUtil,
                                                       com.day.cq.security.Authorizable,
                                                       com.day.cq.security.profile.Profile,
                                                       com.day.cq.wcm.api.WCMMode,
                                                       com.day.cq.wcm.webservicesupport.Configuration,
                                                       com.day.cq.wcm.webservicesupport.ConfigurationManager,
                                                       com.svu.bannersites.cq5.services.userprofile.UserNewProfileServices,
													   com.day.cq.security.AccountManager,
													   com.adobe.granite.security.user.UserProperties,
org.apache.jackrabbit.api.security.user.*, 
com.day.cq.commons.jcr.*,
com.svu.bannersites.cq5.services.social.SocialProfileServices,
java.util.Map,
com.svu.bannersites.cq5.services.userprofile.ProfileProperty,
com.supervalu.b2c.webservices.profile.LoginTypeEnum,
com.supervalu.b2c.webservices.profile.LoginResult"%><%
%>
<%
    // getting the username of the logged-in user
    Authorizable au = resourceResolver.adaptTo(Authorizable.class);
    final String userId = au.getID().replace("\"", "\\\"").replace("\r", "\\r").replace("\n", "\\n");
    pageContext.setAttribute("userId", userId);

    ConfigurationManager cfgMgr = sling.getService(ConfigurationManager.class);
    Configuration facebookConfiguration = null;
    Configuration twitterConfiguration = null;

    String[] services = pageProperties.getInherited("cq:cloudserviceconfigs", new String[]{});
    int connectServiceCount = 0;
    if (cfgMgr != null) {
        facebookConfiguration = cfgMgr.getConfiguration("facebookconnect", services);
        twitterConfiguration = cfgMgr.getConfiguration("twitterconnect", services);
        if (facebookConfiguration != null){
            connectServiceCount++;
        }
        if (twitterConfiguration != null){
            connectServiceCount++;
        }
    }

    I18n i18n = new I18n(slingRequest);
    final String uniqSuffix = resource.getPath().replaceAll("/", "-").replaceAll(":", "-");
    final String divID = "sociallogin" + uniqSuffix;

    final Profile currentProfile = resourceResolver.adaptTo(Profile.class);
    final boolean isAnonymous = ProfileUtil.isAnonymous(currentProfile);
    final boolean isDisabled = WCMMode.DISABLED.equals(WCMMode.fromRequest(request));
    final String loginSuffix = isDisabled && isAnonymous ? "/j_security_check" : "/connect";

    String redirectTo = properties.get("redirectTo", "");

    final String contextPath = slingRequest.getContextPath();
    final String message = properties.get("message", i18n.get("Sign In or Register"));
    final JSONObject dialogConfig = new JSONObject();
    Integer dialogWidth = 630;
    Integer dialogHeight = 400;
    dialogConfig.putOpt("width", dialogWidth);
    dialogConfig.putOpt("height", dialogHeight);
    dialogConfig.put("dialogClass", "sociallogin-dialog");
    String bannerID = null;
%>
<c:choose>
	<c:when test="${bannerSpecifier == 'cub'}">
	<% bannerID = "7"; %>
	</c:when>
	<c:when test="${bannerSpecifier == 'farmfresh'}">
	<% bannerID = "8"; %>
	</c:when>
	<c:when test="${bannerSpecifier == 'shoppers'}">
		<% bannerID = "12"; %>
	</c:when>
	<c:when test="${bannerSpecifier == 'shopnsave'}">
		<%  bannerID = "11";%>
	</c:when>
	<c:when test="${bannerSpecifier == 'hornbachers'}">
		<%  bannerID = "9"; %>
	</c:when>
	<c:when test="${bannerSpecifier == 'rainbowfoods'}">
		<%  bannerID = "17"; %>
	</c:when>
	<c:when test="${bannerSpecifier == 'cmwa'}">
		<%  bannerID = "18"; %>
	</c:when>
</c:choose>
<%
UserProperties props = resourceResolver.adaptTo(UserProperties.class);
String profileID = props.getProperty("facebook/id");
if(profileID != null){
SocialProfileServices socialprofile = sling.getService(SocialProfileServices.class);
socialprofile.setloginToken(slingRequest,slingResponse);
Map<ProfileProperty, String> facebookmap = socialprofile.getSocialProperties(slingRequest,LoginTypeEnum.FACEBOOK);
LoginResult loginresult = socialprofile.getSocialAccount(slingRequest,slingResponse,profileID,LoginTypeEnum.FACEBOOK,bannerID,facebookmap);
if(loginresult.isNewLogin() == true){%>
<script>
SVUMaster.socialSignupFlow = true;
</script>
<%}else{
} 
}
%>    
          <%
          if (facebookConfiguration != null) {
            Resource configResource = facebookConfiguration.getResource();
            Page configPage = configResource.adaptTo(Page.class);
            final String configid = configPage.getProperties().get("oauth.config.id", String.class);
         %> 
<script type="text/javascript">
SVUMaster.simpleSocialDataFacebook = {
  divID: '<%= xssAPI.encodeForJSString(divID) %>',
  configPath: '<%= xssAPI.encodeForJSString(configPage.getPath()) %>',
  configid: '<%= xssAPI.encodeForJSString(configid) %>',
  loginSuffix: '<%= loginSuffix %>',
  contextPath: '<%= xssAPI.encodeForJSString(contextPath) %>'
};
</script>
<%}%>
<%if (twitterConfiguration != null) {
            Resource configResource = twitterConfiguration.getResource();
            Page configPage = configResource.adaptTo(Page.class);
            final String configid = configPage.getProperties().get("oauth.config.id", String.class);
    %>
<script type="text/javascript">
SVUMaster.simpleSocialDataTwitter = {
  divID: '<%= xssAPI.encodeForJSString(divID) %>',
  configPath: '<%= xssAPI.encodeForJSString(configPage.getPath()) %>',
  configid: '<%= xssAPI.encodeForJSString(configid) %>',
  loginSuffix: '<%= loginSuffix %>',
  contextPath: '<%= xssAPI.encodeForJSString(contextPath) %>'
};
</script>
<%}%>