var mapLoaded = false;

function initMapToggle() {
  $(".toggle-map").click(function() {
    toggleMap(true);
    return false;
  });

  $(".toggle-img").click(function() {
    toggleMap(false);
    return false;
  });
}

function toggleMap(show) {
  if (show) {
    $("#store-img").css({display:"none"});
    $("#store-map").css({display:"inline"});
    if (!mapLoaded) {
      loadGMaps(googleAPIKey, mapData, bannerName);
      mapLoaded = true;
    }
  }
  else {
    $("#store-img").css({display:"inline"});
    $("#store-map").css({display:"none"});
  }
}