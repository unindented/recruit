(function ($, window, undefined) {

  'use strict';

  window.toggleFullScreen = function () {
    var doc = window.document;
    var permissions = window.Element.ALLOW_KEYBOARD_INPUT;

    if (!doc.fullscreenElement &&
        !doc.mozFullScreenElement && !doc.webkitFullscreenElement) {
      if (doc.documentElement.requestFullscreen) {
        doc.documentElement.requestFullscreen();
      } else if (doc.documentElement.mozRequestFullScreen) {
        doc.documentElement.mozRequestFullScreen();
      } else if (doc.documentElement.webkitRequestFullscreen) {
        doc.documentElement.webkitRequestFullscreen(permissions);
      }
    } else {
      if (doc.cancelFullScreen) {
        doc.cancelFullScreen();
      } else if (doc.mozCancelFullScreen) {
        doc.mozCancelFullScreen();
      } else if (doc.webkitCancelFullScreen) {
        doc.webkitCancelFullScreen();
      }
    }
  };

})(jQuery, window);
