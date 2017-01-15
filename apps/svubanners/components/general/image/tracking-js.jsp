<%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  JS tracking code for linked images

  Adds a JavaScript snippet to the page that records clicks on an image.
  Requires the Image image to be defined.

--%>

<script type="text/javascript">
    (function() {
        var imageDiv = document.getElementById("${divId}");

        var tagNodes = imageDiv.getElementsByTagName('A');
        for (var i = 0; i < tagNodes.length; i++) {
            var link = tagNodes.item(i); 
            link.setAttribute('onclick', '//_gaq.push(["_trackEvent", "${currentPage.title}", "Image Link Click", "${image.title}"])');
        }

    })();
</script>