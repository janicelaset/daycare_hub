// $(window).load(function() {
//   loadScript();
// });

var map;

function autoComplete() {
console.log("init")
  var input = document.getElementById('search-text-field');

  var options = {
          types: ['address'],
          componentRestrictions: {country: 'us'}
        };

  var autocomplete = new google.maps.places.Autocomplete(input, options);

  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  autocomplete.addListener('place_changed', autocomplete.getPlace());


  // map = new google.maps.Map(document.getElementById('map-canvas'), {
  //   center: {lat: -34.397, lng: 150.644},
  //   zoom: 8
  // });
   // geocoding
      // var geocoding  = new google.maps.Geocoder();
      // $("#submit_button_geocoding").click(function(){
      //   codeAddress(geocoding);
      // });
      // $("#submit_button_reverse").click(function(){
      //   codeLatLng(geocoding);
      // });
}

var info;
function codeLatLng(geocoding){

  var input = $('#search_box_reverse').val();
  console.log(input);

  var latlngbounds = new google.maps.LatLngBounds();
  var listener;
  var regex = /([1-9])+\.([1-9])+\,([1-9])+\.([1-9])+/g;
  if(regex.test(input)) {
  var latLngStr = input.split(",",2);
  var lat = parseFloat(latLngStr[0]);
  var lng = parseFloat(latLngStr[1]);
  var latLng = new google.maps.LatLng(lat, lng);
  geocoding.geocode({'latLng': latLng}, function(results, status) {
     if (status == google.maps.GeocoderStatus.OK){
       if(results.length > 0){
         //map.setZoom(11);
         var marker;
         map.setCenter(results[1].geometry.location);
         var i;
        info = createInfoWindow("");
         for(i in results){
           latlngbounds.extend(results[i].geometry.location);
             marker = new google.maps.Marker({
             map: map,
             position: results[i].geometry.location
           });

          google.maps.event.addListener(marker, 'click', (function(marker,i) {
            return function() {
            info.setContent(results[i].formatted_address);
            info.open(map,marker);
            }
          })(marker,i));
        }

         map.fitBounds(latlngbounds);
         listener = google.maps.event.addListener(map, "idle", function() {
          if (map.getZoom() > 16) map.setZoom(16);
            google.maps.event.removeListener(listener);
          });
       }
     }
    else{
       alert("Geocoder failed due to: " + status);
     }
  });
  }else{
    alert("Wrong lat,lng format!");
  }
}
function codeAddress(geocoding){
  console.log("in codeAddress")
  var address = $("#search_box_geocoding").val();
  if(address.length > 0){
    geocoding.geocode({'address': address},function(results, status){
      if(status == google.maps.GeocoderStatus.OK){
        map.setCenter(results[0].geometry.location);
        var marker  =  new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
        }else{
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }else{
    alert("Search field can't be blank");
  }
}

function fullAddress(address) {
  return address.street + ", " + address.city + ", " + address.state + address.zip;
}

function milesToMeters(miles) {
  //1 mile = 1609.344 meters
  return miles * 1609.344;
}

function displaySearchResults(origin, radius, addresses, daycares, images) {

  //google distance matrix values always expressed in meters
  radius = milesToMeters(radius);
console.log(radius);
  //addresses sent as string
  //"[&quot;2222 SE Foxglove Ct, Hillsboro, OR 97123&quot;, &quot;18000 SW Farmington Rd, Aloha, OR 97007&quot;, &quot;15135 SW Beard Rd, Beaverton, OR 97007&quot;, &quot;18685 SW Baseline Rd, Beaverton, OR 97006&quot;, &quot;15150 SW Koll Pkwy, Beaverton, OR 97006&quot;]"
// console.log(origin);
// console.log(radius);
// console.log(addresses);

daycares = daycares.replace(/&quot;/g, '"');
daycares = JSON.parse(daycares);
console.log(daycares);

addresses = addresses.replace(/&quot;/g, '"');
addresses = JSON.parse(addresses);

images = images.replace(/&quot;/g, '"');
images = JSON.parse(images);
console.log(images);

var destination = [];
addresses.forEach(function(address) {
  address = fullAddress(address);
  destination.push(address);
});
console.log(addresses);
console.log(destination);


  //parse and convert to array of addresses
  // addresses = addresses.replace(/\[/g, '');   //remove brackets
  // addresses = addresses.replace(/\]/g, '');
  // addresses = addresses.split('&quot;, &quot;');

  //results in array
  // ["&quot;2222 SE Foxglove Ct, Hillsboro, OR 97123", "18000 SW Farmington Rd, Aloha, OR 97007", "15135 SW Beard Rd, Beaverton, OR 97007", "18685 SW Baseline Rd, Beaverton, OR 97006", "15150 SW Koll Pkwy, Beaverton, OR 97006&quot;"]

  //remove &quot; from first and last address
  // var destination = [];
  // addresses.forEach(function(address) {
  //   address = address.replace(/&quot;/g, '');
  //   destination.push(address);
  // });

  var bounds = new google.maps.LatLngBounds;
  var markersArray = [];
  var infoWindowContentArray = [];

  // var origin1 = {lat: 55.93, lng: -3.118};
  // var origin2 = 'Greenwich, England';
  // var destinationA = 'Stockholm, Sweden';
  // var destinationB = {lat: 50.087, lng: 14.421};

  // var destinationIcon = 'https://chart.googleapis.com/chart?' +
  //     'chst=d_map_pin_letter&chld=D|FF0000|000000';
  // var originIcon = 'https://chart.googleapis.com/chart?' +
  //     'chst=d_map_pin_letter&chld=O|FFFF00|000000';
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    center: {lat: 39.8282, lng: -98.5795},
    zoom: 4
  });

  var geocoder = new google.maps.Geocoder;
  var service = new google.maps.DistanceMatrixService;
  service.getDistanceMatrix({
      // origins: [origin1, origin2],
      // destinations: [destinationA, destinationB],
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
          // var icon = asDestination ? destinationIcon : originIcon;
          return function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
              map.fitBounds(bounds.extend(results[0].geometry.location));
              var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location,
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
              // markersArray.push(new google.maps.Marker({
              //   map: map,
              //   position: results[0].geometry.location,
              //   // icon: icon
              // }));
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
              var content = "<strong>" + daycares[j].name + "</strong>" +
                            "<div>" + addresses[j].street + "</div>" +
                            "<div>" + addresses[j].city + ", " + addresses[j].state + " " + addresses[j].zip + "</div>" +
                            "<p>" + results[j].distance.text + "</p>";
              geocoder.geocode({'address': destinationList[j]},
                  showGeocodedAddressOnMap(true, content));

              $(".row.search-results").append(
                "<div class='col-md-6'>" +
                  "<div class='thumbnail'>" +
                    "<div class='media'>" +
                      "<div class='media-left media-top'>" +
                        "<div class='search-results-image'>" +
                        "<img src=" + images[j] + ">" +
                        // "<img src=" + 'Brick.png' + ">" +
                        "</div>" +
                      "</div>" +
                      "<div class='media-body'>" +
                        "<h4>" + daycares[j].name + "</h4>" +
                        "<div>" + addresses[j].street + "</div>" +
                        "<div>" + addresses[j].city + ", " + addresses[j].state + " " + addresses[j].zip + "</div>" +
                        "<p>" + results[j].distance.text + "</p>" +
                      "</div>" +
                    "</div>" +
                  "</div>" +
                "</div>");
            }
          }
        }
      }
    });

}

function deleteMarkers(markersArray) {
  for (var i = 0; i < markersArray.length; i++) {
    markersArray[i].setMap(null);
  }
  markersArray = [];
}
// <script
//     src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=drawing,places&callback=initialize">
// </script>
function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    '&libraries=drawing,places';
  document.body.appendChild(script);
}
