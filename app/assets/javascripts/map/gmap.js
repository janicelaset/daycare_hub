
function autoComplete() {
  var input = document.getElementById('search-text-field');

  var options = {
          types: ['address'],
          componentRestrictions: {country: 'us'}
        };

  var autocomplete = new google.maps.places.Autocomplete(input, options);

  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  autocomplete.addListener('place_changed', autocomplete.getPlace());
}

function displaySearchResults(origin, radius, addresses, daycares, images, listings) {

  listings = listings.replace(/&quot;/g, '"');
  listings = JSON.parse(listings);

  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    center: {lat: 39.8282, lng: -98.5795},
    zoom: 4
  });

  var geocoder = new google.maps.Geocoder;

  var originIcon = 'https://chart.googleapis.com/chart?' +
      'chst=d_map_pin_letter&chld=O|FFFF00|000000';

  var showGeocodedAddressOnMap = function() {
    return function(results, status) {
      if (status === google.maps.GeocoderStatus.OK) {
        var marker = new google.maps.Marker({
          map: map,
          animation: google.maps.Animation.DROP,
          position: results[0].geometry.location,
          icon: originIcon,
        });
      } else {
        alert('Geocode was not successful due to: ' + status);
      }
    };
  };

  geocoder.geocode({'address': origin}, showGeocodedAddressOnMap());

  var bounds = new google.maps.LatLngBounds;
  for (var i = 0; i < listings.length; i++) {
    // info window content
    if (listings[i].daycare_id) {
      var content_head = "<strong><a href='/daycares/" + listings[i].daycare_id + "'>" + listings[i].name + "</a><strong>";
    }
    else {
      var content_head = "<strong>" + listings[i].name + "<strong>";
    }
    var info_window_content = content_head +
    "<div>" + listings[i].street + "</div>" +
    "<div>" + listings[i].city + ", " + listings[i].state + " " + listings[i].zip + "</div>" +
    "<p>" + listings[i].distance + " miles</p>";

    // markers
    var lat_long = new google.maps.LatLng(listings[i].latitude, listings[i].longitude);
    map.fitBounds(bounds.extend(lat_long));
    addMarker(map, lat_long, info_window_content);

    $(".row.search-results").append(
      "<div class='col-md-6'>" +
        "<div class='thumbnail search-results-thumb'>" +
          "<div class='media'>" +
            "<div class='media-left media-top'>" +
              "<div class='search-results-image'>" +
              "<img src=" + listings[i].image_url + ">" +
              "</div>" +
            "</div>" +
            "<div class='media-body'>" +
              content_head +
              "<div>" + listings[i].street + "</div>" +
              "<div>" + listings[i].city + ", " + listings[i].state + " " + listings[i].zip + "</div>" +
              "<p>" + listings[i].distance + " miles</p>" +
            "</div>" +
          "</div>" +
        "</div>" +
      "</div>");
  }
}

function addMarker(map, lat_long, info_window_content) {

  var infowindow = new google.maps.InfoWindow({
    content: info_window_content
  });

  var marker = new google.maps.Marker({
    map: map,
    animation: google.maps.Animation.DROP,
    position: lat_long,
  });

  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
}
