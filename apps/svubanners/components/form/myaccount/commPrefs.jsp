<%--
 
 Edit My Account Form Component. Communication Preferences Section
 
--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormCommPrefs" %><%
   MyAccountFormCommPrefs commPrefs = new MyAccountFormCommPrefs(pageContext);
   pageContext.setAttribute("commPrefs", commPrefs);
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormContactInfo" %><%
   MyAccountFormContactInfo contactInfo = new MyAccountFormContactInfo(pageContext);
   pageContext.setAttribute("contactInfo", contactInfo);
%><%@page session="false" import="com.svu.bannersites.cq5.components.form.myaccount.MyAccountFormAccountInfo" %><%
   MyAccountFormAccountInfo accountInfo = new MyAccountFormAccountInfo(pageContext);
   pageContext.setAttribute("accountInfo", accountInfo);
%>

<c:set var="wholePhone" value="${fn:escapeXml(contactInfo.userMobilePhone)}"/>
<c:set var="phoneAreaCode" value="${fn:substring(wholePhone, 0, 3)}" />
<c:set var="phone3Digit" value="${fn:substring(wholePhone, 3, 6)}" />
<c:set var="phone4Digit" value="${fn:substring(wholePhone, 6, 10)}" />


<div class="account-edit-section">
   <h2>Communication Preferences</h2>
   <div class="account-edit-section-guts">
       <div class="account-section-details clearfix">
 
 
 
           <div class="col-1 filler">
           </div>
           <div class="col-2">
               <h3>Send To</h3>
           </div>
 
           <c:choose>
               <c:when test="${commPrefs.isAssociate != true}">
                   <a href="#" class="edit ss-myaccount-editcommprefs">Edit</a>
               </c:when>
               <c:otherwise>
                   <a href="#" class="edit ss-myaccount-editcommprefs-associate">Edit</a>
               </c:otherwise>
           </c:choose>
 
           <div>
               <form id="userCommPrefs">
               <ul class="comm-prefs">
                   <li>
                       <div class="currentCommPref">
                       <label>
                       <c:choose>
                           <c:when test="${commPrefs.userPrefEmail }">
                           <input id="userPrefEmail" type="checkbox" checked disabled>
                           </c:when>
                           <c:otherwise>
                           <input id="userPrefEmail" type="checkbox" disabled>
                           </c:otherwise>
                       </c:choose>                        
                       Email
                       </label>
                       </div>
                       <div class='currentCommPrefValue <c:if test="${not commPrefs.userPrefEmail }">hidden</c:if>' id="currentCommPref-email">${fn:escapeXml(commPrefs.userEmail) }</div>
                   </li>
                   <li>
                       <div class="currentCommPref">
                       <label>
                       <c:choose>
                           <c:when test="${commPrefs.userPrefSMStext && not empty phoneAreaCode }">
                           <input id="userPrefSMStext" type="checkbox" checked disabled>
                           </c:when>
                           <c:otherwise>
                           <input id="userPrefSMStext" type="checkbox" disabled>
                           </c:otherwise>
                       </c:choose>                        
                       SMS (text messages)
                       </label>
                       </div>
                       <div class='currentCommPrefValue <c:if test="${not commPrefs.userPrefSMStext }">hidden</c:if>'>
                       		<c:choose>
	                       		<c:when test="${not empty wholePhone}">
		                           (<span id="currentCommPref-phone-areaCode">${phoneAreaCode}</span>)-<span id="currentCommPref-phone-3">${phone3Digit}</span>-<span id="currentCommPref-phone-4">${phone4Digit}</span>
		                       </c:when>
		                   </c:choose>
                       </div>
                   </li>
                   <li>
                       <div class="currentCommPref">
                       <label>
                       <c:choose>
                           <c:when test="${commPrefs.userPrefDirectMail && not empty contactInfo.userFirstName}">
                           <input id="userPrefDirectMail" type="checkbox" checked disabled>
                           </c:when>
                           <c:otherwise>
                           <input id="userPrefDirectMail" type="checkbox" disabled>
                           </c:otherwise>
                       </c:choose>                        
                       Direct Mail
                       </label>
                       </div>
                       <div class='currentCommPrefValue <c:if test="${not commPrefs.userPrefDirectMail }">hidden</c:if>'>
                          <c:if test="${not empty contactInfo.userFirstName }">
                           <div><span id="currentCommPref-address-firstName">${fn:escapeXml(contactInfo.userFirstName) }</span> <span id="currentCommPref-address-lastName">${fn:escapeXml(contactInfo.userLastName) }</span></div>
                           <div>
                            <span id="currentCommPref-address-street">${fn:escapeXml(contactInfo.userAddress) }</span>
                            <c:if test="${not empty contactInfo.userAddress2 }">
                              <span id="currentCommPref-address-apt">${fn:escapeXml(contactInfo.userAddress2) }</span>
                            </c:if>
                          </div>
                           <div><span id="currentCommPref-address-city">${fn:escapeXml(contactInfo.userCity) }</span>, <span id="currentCommPref-address-state">${fn:escapeXml(contactInfo.userState) }</span> <span id="currentCommPref-address-zip">${fn:escapeXml(contactInfo.userZipCode) }</span></div>
                         </c:if>
                       </div>
                   </li>
                 </ul>
           </div>
       </div>
   </div>
</div>