var CENTER_X = 43.4419;
var CENTER_Y = -92.1419;
var center = null;
var map = null;
var geocoder = null;
var addresses = null;
var mgr = null;
var COORDINATES = null;
var all_markers = new Array(); 

function initialize_map_with_xy(xxx, yyy) {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setUIToDefault();
    map.removeMapType(G_SATELLITE_MAP);
    map.removeMapType(G_PHYSICAL_MAP);
    map.disableScrollWheelZoom();          
    map.setCenter(new GLatLng(xxx, yyy), 15);
    var marker = new GMarker(new GLatLng(xxx, yyy));
    map.addOverlay(marker); 
    geocoder = new GClientGeocoder(); 
  }
}

function initialize_map_and_show_markers(info) {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setUIToDefault();
    map.removeMapType(G_SATELLITE_MAP);
    map.removeMapType(G_PHYSICAL_MAP);
    map.addControl(new GLargeMapControl());
    map.enableDoubleClickZoom();
    map.disableScrollWheelZoom();          
    map.setCenter(new GLatLng(CENTER_X, CENTER_Y), 4);
    geocoder = new GClientGeocoder();
    setupMarkers(info);
  }
}

function locate_address() {
   address = jQuery('#find_on_map_query').val();
   if (geocoder) {
      geocoder.getLatLng(
        address,
        function(point) {
          if (!point) {
            alert("Couldn't locate address.");
          } else {
            map.setCenter(point, 15);
            var marker = new GMarker(point);
            map.addOverlay(marker);
            marker.openInfoWindowHtml(address);
            jQuery('#lat').val(point.lat());
            jQuery('#lng').val(point.lng());
          }
        }
      );
    }
} 

function setupMarkers(info) {
  mgr = new MarkerManager(map);
  jQuery.each(info, function() {
    var coordinates = this.coordinates;
    var m = new GMarker(new GLatLng(coordinates[0], coordinates[1]));
    var name = coordinates[2];
    var description = coordinates[3];
    var id = coordinates[4];
    var source = 'http://eb5info.com/regional_centers/' + id;
    var popup_message = "<div class='map_popup'><h1>" + name + "</h1><br/>" + '<address>' + description + '</address><div><a href="' + source +'" target="_blank">view more details &rarr;</a></div></div>';
    GEvent.addListener(m, "click", function() {
      m.openInfoWindowHtml(popup_message);
    });     
    all_markers[id] = {'m': m, 'info': popup_message};
    mgr.addMarker( m, 2 );
  });
  mgr.refresh();
}