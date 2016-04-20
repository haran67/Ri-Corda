function placeMarker(location) {
    var marker = new google.maps.Marker({
        position: location,
        name: 'new',
        map: map
    });
    google.maps.event.addListener(marker, 'click', function () {
        map.setZoom(12);
        map.setCenter(marker.getPosition());
        //getCantiereMarker(marker);
    });
    return marker;
}

//function getCantiereMarker(marker) {
//    decodeMarker(marker);
//}

//function openCantiere(title, city, edificio, via, id, id_ed, voci, btn_val, btn_js, marker) {
//    ModificaCantiere(title, city, edificio, via, id, id_ed, voci, btn_val, btn_js, marker);
//    openModal('#myModalCantiere');
//}

function goSitoMarker(marker, info) {
    map.setZoom(18);
    map.setCenter(marker.getPosition());
    info.open(map, marker);
}

function getInfowindowsData(title, site, city, via, ctr, id) {
//    var contentString = '<div id="content" style="width:300px">' +
//      '<div id="siteNotice">' +
//      '</div>' +
//      '<h2 id="firstHeading">' + title + '</h2>' +
//      '<h3 id="firstHeading">' + site + '</h3>' +
//      '<div id="bodyContent">' +
//      '<p><b>' + city + '</b></p>' +
//      '<p>' + via + '</p>' +
//      '</div>' +
    //      '</div>';    __doPostBack(' + ctr + ',\'' + id + '\')
    var contentString = '<div id="content" style="width:150px">' +
      '<div id="siteNotice">' +
      '</div>' +
      '<div style="width:100%; text-align:left;">' +
      '<a id="btn_scheda" class="btn btn-primary btn-xs button-link-w gisri_button_ws" href="javascript:parent.goSite(\'' + ctr + '\',' + id + ')"><i class=" fa fa-home"></i>&nbsp;</a>' +
      '</div>' +
      '<div>' +
      '<h5 id="firstHeading">' + site + '</h5>' +
      '</div>' +
      '<div id="bodyContent">' +
      '<p><i>' + city + '</i></p>' +
      '<p>' + via + '</p>' +
      '</div>' +
      '</div>';

    //
    return contentString;
}

function decodeMarker(marker) {
    var geocoder = new google.maps.Geocoder();
    /*var latlngStr = '40.714224,-73.961452'.split(',', 2);
    var lat = parseFloat(latlngStr[0]);
    var lng = parseFloat(latlngStr[1]);
    var latlng = new google.maps.LatLng(lat, lng);*/
    geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
        var address = "";
        var city = "X_X";
        var locality = "";
        var country = "";
        var number = "0";
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                for (i = 0; i < results[0].address_components.length; i++) {
                    for (j = 0; j < results[0].address_components[i].types.length; j++) {
                        if (results[0].address_components[i].types[j] == "locality")
                            locality = results[0].address_components[i].long_name;
                        if (results[0].address_components[i].types[j] == "route")
                            address = results[0].address_components[i].long_name;
                        if (results[0].address_components[i].types[j] == "street_number")
                            number = results[0].address_components[i].long_name;
                        if (results[0].address_components[i].types[j] == "administrative_area_level_3")
                            city = results[0].address_components[i].long_name;
                        if (results[0].address_components[i].types[j] == "country")
                            country = results[0].address_components[i].long_name;
                        //alert(results[0].address_components[i].types[j] + ' ' + results[0].address_components[i].long_name);
                    }
                }
                if ((city == "X_X") && (locality != "")) {
                    city = locality;
                }
                if (city != locality && locality != "") {
                    address = address + ', ' + locality;
                }
            }
            else {
                address = "";
            }
        }
        else {
            address = "Geocoder error: " + status;
        }
        if (country == "") {
            country = "Italia";
        }
        if (country.toLowerCase().indexOf("ita") == -1) {
            //alert("Hai scelto una localita' fuori dal territorio Italiano. Al momento puoi usare Progettista 24 solo in italia.");
        }
        else {
//            NuovoCantiere(city, address, number, results[0].geometry.location.lat(), results[0].geometry.location.lng(), marker);
//            openModal('#myModalCantiere');
        }
    });
}
