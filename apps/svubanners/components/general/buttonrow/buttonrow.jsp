<%--

  Button Row component.

--%><%
%><%@include file="/apps/svubanners/global.jsp"%><%
%><%@page session="false" import="com.svu.bannersites.cq5.components.general.ButtonRow"%><%
    ButtonRow buttonRow = new ButtonRow(pageContext);
    pageContext.setAttribute("buttonRow",buttonRow);
%>


<c:choose>
    <c:when test="${buttonRow.authorMode && not buttonRow.print && not buttonRow.share}">
        <div id="utility-wrapper" class="hideprint" role="navigation">
            <ul>
                <li>button row is empty!</li>
            </ul>
        </div>
    </c:when>
    <c:otherwise>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<div id="utility-wrapper" class="hideprint" role="navigation">
    <ul>
        <c:if test="${buttonRow.share}">
            <li id="fb-like">
                <script type="text/javascript">
                    var facebookLike = '<iframe src="http://www.facebook.com/plugins/like.php?href=' + document.URL + '&layout=button_count&locale=en_US" scrolling="no" frameborder="0" style="border:none; width:450px; height:80px;"></iframe>';
                    document.write(facebookLike); 
                </script>
            </li>
        </c:if>
        <%--
        <c:if test="${buttonRow.saveRecipe }">
            <li id="left">
                <a onclick="//_gaq.push('Recipes', 'Add To Recipe Box (Listing)', '[${buttonRow.recipe.name}(${buttonRow.recipe.recipeId })]');" 
                    href="/services/recipebox.html?recipeId=${buttonRow.recipe.recipeId}&recipeSource=ThirdPartyRecipe" class="alternate">&nbsp;SAVE </a>
            </li>
        </c:if>
        <c:if test="${buttonRow.savedRecipe }">
            <li id="left" class="alternate">SAVED</li>
        </c:if>
        --%>
        <c:if test="${buttonRow.print}">
            <li id="right">
                <a class="alternate" href="javascript:window.print();" >&nbsp;PRINT</a>
            </li>
        </c:if>
        <c:if test="${buttonRow.share}">
            <li id="twitter-tweet">
                <script type="text/javascript" charset="utf-8">
                    var tweetShare = '<a href="https://twitter.com/share" data-url="' + document.URL + '" class="twitter-share-button" data-lang="en">Tweet</a>';
                    document.write(tweetShare);

                    window.twttr = (function (d,s,id) {
                        var t, js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return; js=d.createElement(s); js.id=id;
                        js.src="//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs);
                        return window.twttr || (t = { _e: [], ready: function(f){ t._e.push(f) } });
                    }(document, "script", "twitter-wjs"));
                </script>


            </li>
        </c:if>
    </ul>
</div>
    </c:otherwise>
</c:choose>