jQuery.Overlay = {
  initialize: function() {
    _overlay = $('<div/>').attr('id', 'overlay').prependTo('body');
    _overlay_content = $('<div/>').attr('id', 'overlay_content').css({
      'position': 'absolute',
      'background': 'white',
      'opacity': 'none',
      'z-index': '9900',
      'text-align': 'left',
      'padding': '5px 10px'
    });
    _overlay.after(_overlay_content);
    _overlay = $('div#overlay').css({
      'display': 'none',
      'position': 'absolute',
      'opacity': '0.7',
      'background': 'black',
      'top': '0',
      'left': '0',
      'text-align': 'center',
      'z-index': '9000',
      'width': $(window).width(),
      'height': $(document).height()
    });
    _overlay.click(this.hide);
    $(document).resize(function () {
      overlay.css({
        'width': $(document).width(),
        'height': $(document).height()
      });
    });
  },
  _append_close_link: function() {
    _close_link = $('<div>x</div>').attr('id', 'overlay_close').css({
      'position': 'absolute',
      'right': '0',
      'top': '0',
      'padding': '1px 6px',
      'color': 'black',
      'font-weight': 'bold',
      'font-size': '14px',
      'line-height': '16px',
      'cursor': 'pointer'
    });
    _close_link.click(this.hide);
    _overlay_content.append(_close_link);
  },
  show: function(options) {
    options = $.extend({width: 600, top: 100}, options)
    window.scroll(0, 0); 
    var step = (jQuery(document).width() - options.width) / 2;
    _overlay_content.css('left', step + 'px').css('top', options.top + 'px').css('width', options.width); 
    _overlay_content.html( $(options.source).html() );
    this._append_close_link();
    _overlay_content.fadeIn();
    _overlay.fadeIn();
  },
  hide: function() {
    _overlay_content.fadeOut();
    _overlay.fadeOut('slow');
  }
}