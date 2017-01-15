<%--

  Display PDF component.

  Component to render pdf file in an iFrame within a pge

--%><%@include file="/apps/svubanners/global.jsp" %>
<%@page session="false"%>
<%
	String source = properties.get("iframesource","#");
	String width = properties.get("width","200");
	String height = properties.get("height","400");
%>
<div id="wrapper-content">  

    <!--[if lte IE 8 ]>
        <iframe id="iframe_content" width="<%=width%>" src="<%=source%>" height="<%=height%>">
          <p>Your browser does not support iframes.</p>
        </iframe>
    <![endif]-->  

    <!--[if gt IE 8 ]>
        <iframe id="iframe_content" width="<%=width%>" src="<%=source%>" height="<%=height%>">
          <p>Your browser does not support iframes.</p>
        </iframe>
    <![endif]-->
    
    <!--[if !IE]><!-->
        <iframe id="iframe_content" width="<%=width%>" src="<%=source%>" height="<%=height%>">
            <p>Your browser does not support iframes.</p>
        </iframe>
    <!--<![endif]-->
</div>

<script type="text/javascript">
  // This makes the page properties available to JS
  var pageProps = {iframeSource: "<%=source%>",
                   height: "<%=height%>",
                   width: "<%=width%>"};
</script>