if (!map) {
  var map;
}
if (!geocoder) {
  var geocoder;
}
if (!point) {
  var point;
}
if (!google) {
  var google;
}

var directionsDisplay;
var directionsService;

function loadGMaps(apiKey, keyName, bannerName) {
  var channel = bannerName.replace(/\s+/g, '-').replace(/[^\w^-]/g, '').toLowerCase();
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = location.protocol + "//maps.googleapis.com/maps/api/js?v=3&client=" + apiKey +  "&channel=" + channel + "&sensor=false&callback=initialize";
  document.getElementsByTagName("head")[0].appendChild(script);
}

function initMap(divName) {
  var mapOptions = {
    zoomControl: true,
    mapTypeControl: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById(divName), mapOptions);
  google = google;
  geocoder = new google.maps.Geocoder();
}

function addIcon(point, imagePath, infoWindowContent, marker) {
  var infowindow = new google.maps.InfoWindow({ content: infoWindowContent });
  var newMarker;

  if (!marker) {
    newMarker = new google.maps.Marker({
      icon: imagePath,
      position: point,
      map: map
    });
  }
  else {
    newMarker = marker;
  }

  newMarker.setMap(map);

  google.maps.event.addListener(newMarker, "click", function() {
    infowindow.open(map, newMarker);
  });
}

function markPoint(point, number, infoHTML) {
  var letter = String.fromCharCode("A".charCodeAt(0) + number);

  if (++number < 10) {
    number = "0" + number;
  }

  addIcon(point, "/etc/designs/svubanners/master/images/mapmarkers/" + number + ".png", infoHTML);
}

function showAddress(clientLoc, imagepath) {
  var clientLocation = null;

  if (typeof clientLoc == "string") {
    geocoder.geocode({ "address" : clientLoc }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        clientLocation = results[0].geometry.location;
        addAddressIcon();
      }
      else {
        // Address not found
      }
    });
  }
  else {
    clientLocation = new google.maps.LatLng(clientLoc.coords.latitude, clientLoc.coords.longitude);
    addAddressIcon();
  }

  function addAddressIcon() {
	if (clientLocation != null) {
	  map.setCenter(clientLocation, 10)
	  addIcon(clientLocation, imagepath, "");
    }
  }
}

function getStoreHtml(banner, address1, address2, city, state, zip, phone, id, action) {
  var sResult = "";

  if (banner && banner.length) {
    sResult += '<span class="name"><b>' + banner + '</b></span>';
  }

  sResult += '<br /><br /><span class="address-1">' + address1 + '</span>' +
    '<span class="address-2"><br />' + city + ', ' + state + ' ' + zip +
    '<br />' + phone + '</span><br /><br /><span class="name"><a href="' +
    action + address1 + "," + city + "," + state + " " + zip +
    '">Get Directions</a></span>';

  return sResult;
}

function showDirections(fromLoc, toLoc, elemId) {
  directionsService = new google.maps.DirectionsService();
  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById(elemId));

  var request = {
    origin: fromLoc,
    destination: toLoc,
    travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

function getAddressFromLatLang(lat, lng) {
  var latLng = new google.maps.LatLng(lat, lng);
  var result = null;

  geocoder.geocode({ "location": latLng }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[1]) {
        result = results[1].formatted_address;
      }
    }
  })

  return result;
}