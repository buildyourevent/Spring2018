
$(document).ready(function () {

//javascript for price slider
$(function () {
    $("#slider-range-min").slider({
        range: "min",
        value: 500,
        min: 1,
        max: 1000,
        slide: function (event, ui) {
            $("#amount").val("$" + ui.value);
        }
    });
    $("#amount").val("$" + $("#slider-range-min").slider("value"));
});

});

//google map function
function initMap() {

    var currentLocation = new google.maps.LatLng("45.4215", "-75.6972");

    var myCenter = currentLocation;
    var mapCanvas = document.getElementById("googleMap");
    var mapOptions = {
        center: myCenter,
        zoom: 9
    };
    map = new google.maps.Map(mapCanvas, mapOptions);

    var marker = new google.maps.Marker({
        position: currentLocation,
        title: "First Venue!"
    });
    marker.setMap(map);
}