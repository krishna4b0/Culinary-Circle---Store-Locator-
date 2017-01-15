<%--
  Copyright 1997-2010 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you ente#ef3e42 into
  with Day.

  ==============================================================================

  Default global styles script.

  Includes all css style sheets from the design required for all pages.  
  Template specific css styles should go in stylesExt.jsp

  ==============================================================================

--%>
    <%@include file="/apps/svubanners/global.jsp"%>
        <%@page session="false"%>

           

            <c:if test="${not empty template.bannerWebFontKey }">
                <link rel="stylesheet" type="text/css" href="//fast.fonts.net/cssapi/${template.bannerWebFontKey }.css" />
            </c:if>

            <cq:include script="stylesExt.jsp" />
            <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.2/css/foundation.css">
            <link rel="stylesheet" type="text/css" href="/etc/designs/svubanners/${bannerSpecifier}/css/${bannerSpecifier}-combinedss-responsive.css">
            

            <link rel="stylesheet" type="text/css" media="print" href="<%=masterDesignPath %>/css/print.css">

            <style>
                body {
                    font-family: 'Myriad W01 Regular', Helvetica, Arial, sans-serif;
                    font-size: 12px;
                }
                
                article {
                    overflow-y: auto;
                }
                
                article,
                body,
                html,
                .off-canvas-wrap,
                .off-canvas-wrap .inner-wrap,
                .row {
                    height: 100%;
                    width: 100%;
                }
                
                .mobile-header {
                    position: fixed;
                    top: 0;
                    width: 100%;
                    z-index: 99;
                    -webkit-box-shadow: 0px 5px 15px 0px rgba(34, 34, 34, 0.51);
                    ;
                    -moz-box-shadow: 0px 5px 15px 0px rgba(34, 34, 34, 0.51);
                    ;
                    box-shadow: 0px 5px 15px 0px rgba(34, 34, 34, 0.51);
                    ;
                    -webkit-transform: translatez(0);
                    -moz-transform: translatez(0);
                    -ms-transform: translatez(0);
                    -o-transform: translatez(0);
                    transform: translatez(0);
                }
                
                .content-area-container {
                    margin: 0 auto;
                    padding: 0;
                    max-width: 960px;
                    float: none;
                    border-left: 1px solid #ccc;
                    border-right: 1px solid #ccc;
                    box-shadow: 0 0 15px #222;
                }
                
                .banner {
                    position: relative;
                    height: 194px;
                    border-bottom: 4px solid #ef3e42;
                    margin-bottom: 20px;
                }
                
                .copyright {
                    margin: 0 auto;
                }
                
                .mobile-nav .nav-primary {
                    margin-right: 20px;
                    margin-top: 45px;
                    border-top: 1px solid #ccc;
                    margin-left: 0;
                }
                /*                main mobile nav*/
                
                .mobile-nav .nav-primary li {
                    list-style: none;
                }
                
                .mobile-nav .nav-primary a {
                    padding: 5px 10px;
                    display: block;
                    border-bottom: 1px solid #ccc;
                    border-right: 1px solid #ccc;
                }
                
                .mobile-nav .mobile-expand {
                    float: right;
                    padding: 0 10px;
                }
                
                .mobile-nav .nav-primary > li.has-dropdown > ul {
                    margin: 0;
                    display: none;
                }
                
                .mobile-nav .nav-primary > li ul a {
                    padding-left: 30px;
                }
                
                .mobile-nav nav.tab-bar {
                    background: #fff;
                }
                
                .mobile-nav nav.tab-bar .slideout-menu {
                    border: none;
                }
                
                .mobile-nav nav.tab-bar .sign-up-links {
                    color: #555;
                }
                
                .mobile-nav nav.tab-bar .sign-up-links a {
                    color: #555;
                }
                
                .mobile-nav .left-off-canvas-menu {
                    background: #fff;
                }
                
                .mobile-nav .left-off-canvas-menu .off-canvas-list li {
                    background: #fff;
                }
                
                .mobile-nav .left-off-canvas-menu a {
                    color: #555;
                    border-color: #ccc;
                }
                
                .mobile-nav .left-off-canvas-menu a span {
                    float: right;
                }
                
                .mobile-nav .left-off-canvas-menu a:hover {
                    background: #ef3e42;
                    color: #fff;
                }
                
                .mobile-nav .left-off-canvas-menu input.mobile-search {
                    margin: 10px;
                    border-bottom: 1px solid #ccc;
                    width: 205px;
                }
                
                .mobile-nav .left-off-canvas-menu ul.sub-menu {
                    display: none;
                    margin: 0;
                }
                
                .mobile-nav .left-off-canvas-menu ul.sub-menu li {
                    list-style: none;
                }
                
                .mobile-nav .left-off-canvas-menu ul.sub-menu li a {
                    padding-left: 30px;
                }
                
                .mobile-nav .menu-icon span:after {
                    box-shadow: 0 0 0 1px #F50B0B, 0 7px 0 1px #F50B0B, 0 14px 0 1px #F50B0B;
                }
                /*                main site nav*/
                
                .main-nav-container .nav-primary {
                    background: none;
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    margin: 0;
                }
                
                .main-nav-container .nav-primary > li {
                    float: left;
                    list-style: none;
                    position: relative;
                    margin: 0;
                }
                
                .main-nav-container .nav-primary a {
                    font-family: 'Myriad W01 Regular', Helvetica, Arial, sans-serif !important;
                    background: #fff;
                    color: #666;
                    font-size: 19px;
                }
                
                .main-nav-container .nav-primary .mobile-expand {
                    display: none;
                }
                
                .main-nav-container .nav-primary a:hover {
                    background: #ef3e42;
                    color: #fff;
                }
                
                .main-nav-container .nav-primary > li > a {
                    padding: 4px 10px;
                }
                
                .main-nav-container .nav-primary ul.dropdown {
                    border: 1px solid #ef3e42;
                    position: absolute;
                    left: -9999em;
                    list-style: none;
                    margin: 0;
                    padding: 0;
                    z-index: 50;
                    background: #fff;
                }
                
                .main-nav-container .nav-primary ul.dropdown a {
                    padding: 12px 20px;
                    width: 195px;
                    display: block;
                    line-height: 1em;
                }
                
                .main-nav-container .nav-primary li.has-dropdown:hover ul {
                    left: 0;
                }
                
                .main-nav-container .nav-primary li.has-dropdown.hover > a {
                    background: #ef3e42;
                    color: #fff;
                }
                
                .utilityNav {
                    position: absolute;
                    top: 60px;
                    right: 160px;
                }
                
                #nav-account {
                    list-style: none;
                }
                
                #nav-account li {
                    font-size: 12px;
                }
                
                #nav-account > li {
                    float: left;
                    z-index: 1;
                    border-left: #666 1px solid;
                    padding: 0 10px;
                    margin-left: 0px;
                }
                
                #nav-account > li.login-my-tools {
                    width: 90px;
                    height: 29px;
                    background-image: url(https://www.cub.com/etc/designs/svubanners/master/img/bg-login-options-narrow.png);
                    position: relative;
                    cursor: pointer;
                    padding: 3px 0 0 28px;
                    border: none;
                    margin: -3px 11px 0 0;
                }
                
                .login-options {
                    position: absolute;
                    left: -9999em;
                    list-style: none;
                    margin: 0;
                    background: #fff;
                    width: 128px;
                    padding: 10px 30px;
                    background: url("https://www.cub.com/etc/designs/svubanners/master/img/bg-login-options-expanded-narrow.png") no-repeat left bottom;
                }
                
                #nav-account .login-options a {
                    text-transform: capitalize;
                    font-size: 10px;
                }
                
                #nav-account .login-options a:hover {
                    text-decoration: underline;
                }
                
                .login-my-tools:hover .login-options {
                    left: 0;
                }
                
                #nav-account ul.login-options li.pad {
                    padding-top: 8px;
                }
                
                #logo {
                    background: url("/content/dam/svubanners/cub/en/bg-header-logo.png") no-repeat;
                    position: absolute;
                    text-indent: -9999px;
                    top: 75px;
                    left: 10px;
                    width: 367px;
                    height: 58px;
                }
                
                .mobile-logo {
                    padding-bottom: 8px;
                    border-bottom: 4px solid #ef3e42;
                    margin-bottom: 8px;
                }
                
                #nav-account>li:first-child {
                    border: none;
                }
                
                #nav-account a {
                    color: #999;
                    font-size: 12px;
                    text-decoration: none;
                    text-transform: uppercase;
                }
                
                .site-search-container {
                    position: absolute;
                    bottom: 50px;
                    right: 18px;
                }
                
                .site-search-label {
                    text-indent: -9999em;
                }
                
                .site-search-button {
                    text-indent: -9999em;
                    width: 20px;
                    height: 20px;
                    margin: 0 0 0 10px;
                    padding: 0;
                    background: url(https://www.cub.com/etc/designs/svubanners/master/img/icn-grey-arrow-round.png) no-repeat;
                }
                
                .site-search-button:hover {
                    background: url(https://www.cub.com/etc/designs/svubanners/master/img/icn-grey-arrow-round.png) no-repeat;
                }
                
                .footer-lead {
                    font-size: 16px;
                }
                
                .cub-rewards-text {
                    font-size: 14px;
                }
                
                .cub-rewards-image {
                    float: left;
                    margin-right: 10px;
                }
                
                .footer-navigation-container {
                    background: #eee;
                    overflow: hidden;
                    padding-top: 10px;
                }
                
                .footer-nav {
                    list-style: none;
                    float: left;
                    margin: 0;
                    text-transform: lowercase;
                    font-size: 14px;
                    margin-left: 14px;
                }
                
                .footer-nav li {
                    margin: 0;
                    padding: 0;
                    float: left;
                    border-left: 1px solid #ccc;
                }
                
                .footer-nav li:first-child {
                    border: none;
                }
                
                .footer-nav li a {
                    color: #666;
                    padding: 3px;
                }
                
                .footer-copyright {
                    font-size: 14px;
                    color: #666;
                    float: right;
                    margin-right: 15px;
                }
                
                .breadcrumb-wrapper {
                    margin-bottom: 1em;    
                }
                
                .breadcrumb-container ul {
                    list-style: none;
                    margin: 0;
                }
                
                .breadcrumb-container ul li {
                    background: url("https://www.cub.com/etc/designs/svubanners/master/images/bg-nav-breadcrumb.gif") 0 center no-repeat;
                    float: left;
                    padding-left: 15px;
                    margin-right: 7px;
                    font-size: 12px;
                }
                
                .breadcrumb-container ul li:first-child {
                    background: none;
                    padding: 0;
                }
                
                .breadcrumb-container ul li a {
                    text-decoration: underline;
                    text-transform: lowercase;
                    color: #222;
                }
                
                .sidebar-buttons-container ul {
                    list-style: none;
                    margin: 0;
                    background: #ccc;
                }
                
                .sidebar-buttons-container ul li {
                    width: 100%;
                }
                
                .sidebar-buttons-container ul li a {
    color: #707070;
                    display: block;
                    background: #eee;
                    font-size: 12px;
                    margin: 0;
                    padding: 3px 17px 4px 9px;
                    
    background: url("https://www.cub.com/etc/designs/svubanners/master/images/bg-nav-secondary.gif") 0 50% repeat-x #fff;
    border: 1px solid #DDE0E3;
        
                }
                
                .sidebar-buttons-container ul li a:hover,
                .sidebar-buttons-container ul li a.active {
                    background: url(https://www.cub.com/etc/designs/svubanners/master/images/bg-nav-secondary-hover.gif) 0 50% repeat-x #ef4035;
                    color: #fff;
                }
                
                .shopping-list-container {
                        box-shadow: 0 2px 5px 2px #ccc;
                }
                .shopping-list-container .shopping-list-title {

background-color: #e3e3e3;
background-image: url(https://www.cub.com/etc/designs/svubanners/master/img/widget-feature-top-141.gif);


color: #ef3e42;
font-family: 'Myriad W01 Regular', Helvetica, Arial, sans-serif;
font-size: 14px;
font-weight: bold;


padding: 10px;
text-align: center;
                }
                
                .shopping-list-container .shopping-list-content-empty .empty-shopping-cart-title {
    color: #ef3e42;
    font-size: 15px;
    text-align: center;
                    padding: 10px; 
    font-family: 'Myriad W01 Regular', Arial, Helvetica, sans-serif;                    
                }
                
                .shopping-list-content-empty p {
                    font-family: 'Myriad W01 Regular', Helvetica, Arial, sans-serif;
font-size: 12px;
                }
                
                .shopping-list-container .shopping-list-content-empty .create-a-list {
background-image: url(https://www.cub.com/etc/designs/svubanners/master/images/bg-button.gif);                    display: block;
                    text-align: center;
                    padding: 5px;
                    margin: 20px 10px;
                    color: #fff;
                }
                
                .shopping-list-container .shopping-list-content .shopping-list {
                    margin: 0 0 20px;
                    list-style: none;
                }
                
                .shopping-list-container .shopping-list-content .shopping-list li {
                    border-bottom: 1px dotted #ccc;
                    padding: 5px;
                    overflow: hidden;
                }
                
                .shopping-list-container .shopping-list-content .shopping-list .item-name {
                    float: left;
                    width: 85%;
                    word-wrap: break-word;
                    background: #ccc;
                }
                
                .shopping-list-container .shopping-list-content .shopping-list .remove-item {
                    float: right;
                }
                
                .shopping-list-container .shopping-list-content .add-item {
                    overflow: hidden;
                }
                
                .shopping-list-container .shopping-list-content .add-item input {
                    width: 60%;
                    float: left;
                }
                
                .shopping-list-container .shopping-list-content .add-item button {
                    width: 35%;
                    float: right;
                    margin: 0;
                    padding: 10px 10px 9px;
                }
                
                .shopping-list-container .shopping-list-content .view-full-list a {
                    background: red;
                    color: #fff;
                    display: block;
                    text-align: center;
                    margin: 10px;
                    padding: 5px;
                }
                


.couponsearchform {
  border: none;
  margin: 0;
  padding: 0;
  background: #EBEBEB;
}


.search-coupons-sort-container {
background: url("https://www.cub.com/etc/designs/svubanners/cub/images/bg-coupon-bar.png") bottom repeat-x;  overflow: hidden;
    padding-bottom: 2px;
}

.search-coupons {
  padding-top: 20px;
}

.search-coupons-label {
  font: 19px 'Myriad W01 Regular', Arial, Helvetica, sans-serif;
  color: #ef3e42;
  margin: 10px 0 0;
  text-transform: lowercase;
  text-align: right;
}

#inp-coupon-search {
  width: 240px;
  float: left;
}

.searchCoupon {
  background: url("https://www.cub.com/etc/designs/svubanners/cub/images/red-arrow20x20.png") no-repeat;
  width: 20px;
  height: 20px;
  font-size: 0px;
  margin: 10px 0 0 10px;
  float: left;
  border: none;
}

.sort-by-type-container, .sort-by-property-container {
  float: left;
  margin: 10px 0 0;
}

#coupon-type-label {
  float: left;
  font-size: 16px;
  color: #ef3e42;    
}

#sort-property-label {
  float: left;
  font-size: 16px;
  color: #ef3e42;    
}

#coupon-type, #sortProperty {
  width: 130px;
  float: left;
  padding: 0 10px 0 0;
  margin: 0 4px;
  height: 24px;
  background-color: #fff;
}

.coupons-filter-results-info {
  list-style: none;
  margin-top: 10px;
}
.coupons-filter-results-info li {
  float: left;
  border-left: 1px solid #222;
  padding: 0 4px;
  font-size: 14px;
}
.coupons-filter-results-info li:first-child {
  border: none;
}
.coupons-filter-results-info li a {
  color: red;
  text-decoration: underline;
}

.results-count {
  font-size: 14px;
  margin-top: 10px;
}

.coupon-outer {
  border: 1px solid #999;
  padding: 15px 15px 10px;
    position: relative;
}

.coupon-inner p {
  color: #666;
  font-size: 12px;
}
.coupon-inner p.coupon-date {
  clear: both;
}

.coupon-name {
  font-size: 12px;
}

.img-left {
  max-width: 80px;
  float: left;
  margin: 0 1em 1em 0;
}

                .pagination {
                        background: url("https://www.cub.com/etc/designs/svubanners/cub/images/bg-coupon-bar.png") repeat-x;
                    overflow: hidden;
                    padding: 6px 0;
                }                
.pagination ul {
  list-style: none;
  margin: 0;
    float: right;
    margin-right: 20px;
}
.pagination ol {
  float: right;
  list-style: none;
  padding: 0;
    margin-left: 4px;
}
.pagination li {
  float: left;
  color: #7c7c7c;
  padding: 0 5px;
    font-size: 12px;
}
                
                .pagination li ol li:first-child{
                    padding: 0;
                }
.pagination li a {
  color: red;
  text-decoration: underline;
}

                .pagination .previous {
                        background: url("https://www.cub.com/etc/designs/svubanners/master/images/page-previous.png") no-repeat left 50%;
    padding-left: 12px;
    border-right: 1px solid #ccc;
                    
                }
                .pagination .next {
    border-left: 1px solid #ccc;
                    padding-right: 12px;
                    
                        background: url("https://www.cub.com/etc/designs/svubanners/master/images/page-next.png") no-repeat right 50%;
                }
                
                
   
                .sec-savings .add-to-card span {
                    display: block;
                    margin: 0 auto;
                }
   .sec-savings .add-to-card span.not-saved, .sec-savings .add-offer-to-card span.not-saved {
    background: url("https://www.cub.com/etc/designs/svubanners/cub/images/bg-ecoupon-sprite.png") repeat-x top left;
    height: 36px;
    width: 157px;
    font-size: 0px;
    line-height: 0px;
    text-indent: -10000px;
}             
                
.sec-savings .add-to-card span.inprogress, .sec-savings .add-offer-to-card span.inprogress {
    background: url("https://www.cub.com/etc/designs/svubanners/cub/images/bg-ecoupon-sprite.png") repeat-x bottom right;
    height: 36px;
    width: 157px;
    font-size: 0px;
    line-height: 0px;
    text-indent: -10000px;
}                
                
.sec-savings .add-to-card span.saved, .sec-savings .add-offer-to-card span.saved {
    background: url("https://www.cub.com/etc/designs/svubanners/cub/images/bg-ecoupon-sprite.png") repeat-x 0 bottom;
    height: 36px;
    width: 157px;
    font-size: 0px;
    line-height: 0px;
    text-indent: -10000px;
    display: none;
}                
                
.sec-savings .add-to-card span.not-saved {
    background-repeat: no-repeat;
    background-position: 0% 0%;
}                
                
.sec-savings .add-to-card span.inprogress {
    background-repeat: no-repeat;
    background-position: 100% 100%;
    display: none;
}
                
.sec-savings .add-to-card span.saved {
    background-repeat: no-repeat;
    background-position: 0% 100%;
    box-sizing: border-box;
    border: 1px solid #ef3e42;
    border-radius: 3px;
}                
                
                
                .legalterms-container {
                    margin: 0 42px 0 0;
                    float: right;
                    min-height: 25px;
                    min-width: 1px;
                }                
                .legalterms-container a {
                    color: #ef3e42;
                }
                
                
                #shopping-list-sidebar-items {
                    background: none !important;
                }                
                #shopping-list-sidebar-items td.item-name{
                    font-size: 12px;
                    line-height: 1.1em;
                    padding: 4px;
                    border-bottom: 1px dotted #ccc;
            
                }
                
                
                #shopping-list-sidebar-items td.item-delete{
                    padding: 5px;
                    border-bottom: 1px dotted #ccc; 
                }
                
                #shopping-list-sidebar-items a {
    background: none;
                    min-width: 16px;
                    display: block;
}
                
.widget-shopping-list .add-item button {
    display: inline;
    margin-left: 5px;
    height: 26px;
    width: 46px;
    background: #ef4035 url("../../master/images/bg-button.gif") 100% 50% no-repeat;    
}
                
.widget-shopping-list input {
    border: 1px solid #A5ACB2;
    color: #4F4E4E;
    height: 27px;
    float: left;
    width: 62px;
}                
                
.widget-shopping-list .add-item {
    float: left;
    padding: 15px 0;
}                
                               
                
                .view-full-list{
                    background: #ef4035;
                    width: 100%;
                    padding: 10px 0;
                }                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            </style>