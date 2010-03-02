var CENTER_X = 43.4419;
var CENTER_Y = -92.1419;
var center = null;
var map = null;
var geocoder = null;
var addresses = null;
var mgr = null;
var COORDINATES = null;
var all_markers = new Array();

jQuery(function() { 
  jQuery('div.notice, div.warning, div.error').click(function() {
    jQuery(this).hide();
  });
  /*jQuery('table.zebra tr:even').addClass('even');
  jQuery('table.zebra tr:odd').addClass('odd');*/
  jQuery('#admin_menu > li:first a:first').css('-moz-border-radius-topleft', '16px').css('-moz-border-radius-bottomleft', '16px');
  jQuery('#admin_menu > li:last a:first').css('-moz-border-radius-topright', '16px').css('-moz-border-radius-bottomright', '16px');
  jQuery(".date_field").datepicker({showOn: 'both', buttonImage: '/images/calendar.png', buttonImageOnly: true});
});

var selectMenu = function(id) {
  jQuery('#topNav ul li a').removeClass('hover');
  jQuery(id).addClass('hover');
}

function initialize_map_and_show_address(business_name, address) {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setUIToDefault();
    map.removeMapType(G_SATELLITE_MAP);
    map.removeMapType(G_PHYSICAL_MAP);
    map.disableDragging();
    map.disableContinuousZoom();
    map.disableDoubleClickZoom();
    map.disableScrollWheelZoom();
    map.setCenter(new GLatLng(CENTER_X, CENTER_Y), 4);
    geocoder = new GClientGeocoder();
     if (geocoder) {
        geocoder.getLatLng(
          address,
          function(point) {
            if (!point) {
              //  TODO handle no map?
            } else {
              map.setCenter(point, 13);
              var marker = new GMarker(point);
              map.addOverlay(marker);
              marker.openInfoWindowHtml("<strong>" + business_name + "</strong><br/>" + address);
              GEvent.addListener(marker, "click", function() {
                marker.openInfoWindowHtml("<strong>" + business_name + "</strong><br/>" + address);
              });               
            }
          }
        );
      }
  }
} 

function initialize_map() {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setUIToDefault();
    map.removeMapType(G_SATELLITE_MAP);
    map.removeMapType(G_PHYSICAL_MAP);
    map.setCenter(new GLatLng(CENTER_X, CENTER_Y), 12);
    geocoder = new GClientGeocoder(); 
  }
}

function initialize_map_with_xy(xxx, yyy) {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setUIToDefault();
    map.removeMapType(G_SATELLITE_MAP);
    map.removeMapType(G_PHYSICAL_MAP);
    map.setCenter(new GLatLng(xxx, yyy), 12);
    var marker = new GMarker(new GLatLng(xxx, yyy));
    map.addOverlay(marker);
    geocoder = new GClientGeocoder(); 
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
            map.setCenter(point, 12);
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

function initialize_map_and_show_markers(info) {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setUIToDefault();
    map.removeMapType(G_SATELLITE_MAP);
    map.removeMapType(G_PHYSICAL_MAP);
    map.addControl(new GLargeMapControl());
    map.enableDoubleClickZoom();
    map.setCenter(new GLatLng(CENTER_X, CENTER_Y), 4);
    geocoder = new GClientGeocoder();
    setupMarkers(info);
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
    var popup_message = "<strong>" + name + "</strong><br/>" + description;
    GEvent.addListener(m, "click", function() {
      m.openInfoWindowHtml(popup_message);
    });     
    all_markers[id] = {'m': m, 'info': popup_message};
    mgr.addMarker( m, 2 );
  });
  mgr.refresh();
}

var timeout         = 500;
var closetimer	  	= 0;
var ddmenuitem      = 0;
  
function jsddm_open()
{
  jsddm_canceltimer();
  jsddm_close();
  ddmenuitem = jQuery(this).find('ul').eq(0).css('visibility', 'visible');
}

function jsddm_close()
{
  if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');
}

function jsddm_timer()
{
  closetimer = window.setTimeout(jsddm_close, timeout);
}
  
function jsddm_canceltimer()
{
  if(closetimer)
  {	
    window.clearTimeout(closetimer);
    closetimer = null;
  }
}
 
function initialize_horizontanl_menu() {
  jQuery('.horizontal_menu > li').bind('mouseover', jsddm_open);
  jQuery('.horizontal_menu > li').bind('mouseout',  jsddm_timer);
  document.onclick = jsddm_close;
}