<%--

  Utility Navigation component.

  Utility Navigation

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.navigation.UtilityNavigation"%><%
	UtilityNavigation utilitynavigation = new UtilityNavigation(pageContext);
	pageContext.setAttribute("utilitynavigation", utilitynavigation);
%>
<html>
	<head>
		<style>
			html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
				border: 0;
				font-family: inherit;
				font-size: 100%;
				font-style: inherit;
				font-weight: inherit;
				margin: 0;
				outline: 0;
				padding: 0;
				vertical-align: baseline;
			}
			p, ul, ol {
				margin: 0 0 1em;
			}
			li, dd, blockquote {
				margin-left: 1.6em;
			}
			ul {
				display: inline-block;
				list-style-type: none;
			}
			a, body, li, p {
				color: #707070;
				font-family: "Arial", sans-serif;
				font-size: 12px;
				line-height: 15px;
				text-align: left;
			}
			#nav-account li {
				border-left: #91CFF0 1px solid;
				padding-bottom: 0px;
				padding-left: 10px;
				padding-right: 10px;
				display: inline;
				padding-top: 0px;
			}
			#nav-account {
				margin-top: 14px;
				margin-right: 10px;
			}
			#nav-account a {
				color: #1D7FB6;
				font-size: 11px;
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<cq:include script="userinfo.jsp" />
	</body>
</html>