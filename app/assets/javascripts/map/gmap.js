

var map;

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

var info;


function fullAddress(address) {
  return address.street + ", " + address.city + ", " + address.state + " " +  address.zip;
}

function milesToMeters(miles) {
  //1 mile = 1609.344 meters
  return miles * 1609.344;
}

function displaySearchResults(origin, radius, addresses, daycares, images, listings) {

  //google distance matrix values always expressed in meters
  radius = milesToMeters(radius);
console.log("radius:" + radius);

listings = listings.replace(/&quot;/g, '"');
listings = JSON.parse(listings);
console.log(listings);

daycares = daycares.replace(/&quot;/g, '"');
daycares = JSON.parse(daycares);

addresses = addresses.replace(/&quot;/g, '"');
addresses = JSON.parse(addresses);

images = images.replace(/&quot;/g, '"');
images = JSON.parse(images);

var destination = [];
addresses.forEach(function(address) {
  address = fullAddress(address);
  destination.push(address);
});

  var bounds = new google.maps.LatLngBounds;
  var markersArray = [];
  var infoWindowContentArray = [];

  var destinationIcon = 'https://chart.googleapis.com/chart?' +
      'chst=d_map_pin_letter&chld=D|FF0000|000000';
  var originIcon = 'https://chart.googleapis.com/chart?' +
      'chst=d_map_pin_letter&chld=O|FFFF00|000000';
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    center: {lat: 39.8282, lng: -98.5795},
    zoom: 4
  });

  var geocoder = new google.maps.Geocoder;
  var service = new google.maps.DistanceMatrixService;
  service.getDistanceMatrix({
      origins: [origin],
      destinations: destination,
      travelMode: google.maps.TravelMode.DRIVING,
      unitSystem: google.maps.UnitSystem.IMPERIAL,
      avoidHighways: false,
      avoidTolls: false,
    }, function(response, status) {
      if (status !== google.maps.DistanceMatrixStatus.OK) {
        alert('Error was: ' + status);
      } else {
        var originList = response.originAddresses;
        var destinationList = response.destinationAddresses;
        deleteMarkers(markersArray);

        var showGeocodedAddressOnMap = function(asDestination, contentString) {
          var icon = asDestination ? destinationIcon : originIcon;
          return function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
              map.fitBounds(bounds.extend(results[0].geometry.location));
              var marker = new google.maps.Marker({
                map: map,
                animation: google.maps.Animation.DROP,
                position: results[0].geometry.location,
                icon: icon,
              });
              if(contentString != "") {
                var infowindow = new google.maps.InfoWindow({
                  content: contentString
                });
                marker.addListener('click', function() {
                  infowindow.open(map, marker);
                });
              }
              markersArray.push(marker);
            } else {
              alert('Geocode was not successful due to: ' + status);
            }
          };
        };

        for (var i = 0; i < originList.length; i++) {
          var results = response.rows[i].elements;
          geocoder.geocode({'address': originList[i]},
              showGeocodedAddressOnMap(false, "")); //send empty content for origin

          for (var j = 0; j < results.length; j++) {
            //show addresses within radius
            if(results[j].distance.value <= radius) {
              if (images[j] === null) {
                images[j] = 'Brick.png';
              }
              if (addresses[j].daycare_id) {
                var content = "<strong><a href='/daycares/" + daycares[j].id + "'>" + daycares[j].name + "</a><strong>" +
                "<div>" + addresses[j].street + "</div>" +
                "<div>" + addresses[j].city + ", " + addresses[j].state + " " + addresses[j].zip + "</div>" +
                "<p>" + results[j].distance.text + "</p>";

                $(".row.search-results").append(
                  "<div class='col-md-6'>" +
                    "<div class='thumbnail search-results-thumb'>" +
                      "<div class='media'>" +
                        "<div class='media-left media-top'>" +
                          "<div class='search-results-image'>" +
                          "<img src=" + images[j] + ">" +
                          "</div>" +
                        "</div>" +
                        "<div class='media-body'>" +
                          "<h4><a href='/daycares/" + daycares[j].url + "'>" + daycares[j].name + "</a></h4>" +
                          "<div>" + addresses[j].street + "</div>" +
                          "<div>" + addresses[j].city + ", " + addresses[j].state + " " + addresses[j].zip + "</div>" +
                          "<p>" + results[j].distance.text + "</p>" +
                        "</div>" +
                      "</div>" +
                    "</div>" +
                  "</div>");
              }
              else {
                var content = "<strong>" + addresses[j].name + "</strong>" +
                "<div>" + addresses[j].street + "</div>" +
                "<div>" + addresses[j].city + ", " + addresses[j].state + " " + addresses[j].zip + "</div>" +
                "<div>" + addresses[j].phone + "</div>" +
                "<div style='color: blue;'>" + results[j].distance.text + "</div>";

                $(".row.search-results").append(
                  "<div class='col-md-6'>" +
                    "<div class='thumbnail search-results-thumb'>" +
                      "<div class='media'>" +
                        "<div class='media-left media-top'>" +
                          "<div class='search-results-image'>" +
                          "<img src=" + images[j] + ">" +
                          "</div>" +
                        "</div>" +
                        "<div class='media-body'>" +
                          "<h4>" + addresses[j].name + "</h4>" +
                          "<div>" + addresses[j].street + "</div>" +
                          "<div>" + addresses[j].city + ", " + addresses[j].state + " " + addresses[j].zip + "</div>" +
                          "<p>" + results[j].distance.text + "</p>" +
                        "</div>" +
                      "</div>" +
                    "</div>" +
                  "</div>");
              }
              geocoder.geocode({'address': destinationList[j]},
                  showGeocodedAddressOnMap(true, content));
            }
          }
        }
      }
    });

  for (var i = 0; i < listings.length; i++) {


    //info window content
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
console.log(info_window_content);

var lat_long = { lat: listings[i].latitude, lng: listings[i].longitude};
    createMarkers(map, lat_long, info_window_content);
  }
}

function createMarkers(map, lat_long, info_window_content) {
  var infowindow = new google.maps.InfoWindow({
    content: info_window_content
  });
  //markers
  // console.log(i);
  // console.log(listings[i].latitude);
  // console.log(listings[i].longitude);

  var marker = new google.maps.Marker({
    map: map,
    animation: google.maps.Animation.DROP,
    position: lat_long,
  });

  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
}

function deleteMarkers(markersArray) {
  for (var i = 0; i < markersArray.length; i++) {
    markersArray[i].setMap(null);
  }
  markersArray = [];
}
