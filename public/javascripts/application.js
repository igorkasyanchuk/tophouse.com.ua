function log(message) {
 // console.debug(message);
};

function initialize() {
  jQuery.Overlay.initialize();
  init_menu();
  init_cities_link();
  log('initialize done');
}

// home_link add_realty_link rieltors_link agencies_link companies_link
function select_menu(id) {
  $('ul.menu li').removeClass('selected');
  $(id).addClass('selected');
  if (id != '.add_realty_link') {
    $('.add_realty').slideUp();
  }
}

function init_menu() {
  $('.add_realty_link').click(function() {
    $('.add_realty').slideDown();
    select_menu('.add_realty_link');
  });
  $('.home_link').click(function() { select_menu(this) } );
  $('.rieltors_link').click(function() { select_menu(this) } );
  $('.agencies_link').click(function() { select_menu(this) } );
  $('.companies_link').click(function() { select_menu(this) } );
}

function hide_add_realty_block() {
  $('.add_realty').addClass('none');  
};

function init_cities_link() {
  $('#change_city_link').removeAttr('href').css('cursor', 'pointer').click(function() {
    jQuery.Overlay.show({width: 500, top: 50, source: '.cities_popup'});
  });
};