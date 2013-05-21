//= require jquery
//= require jquery_ujs
//= require ./utils
//= require ./messenger

(function ($, window, undefined) {

  'use strict';

  var messenger = new window.Messenger('#messages');

  // Show messages that came through XHRs.
  $(window.document)
    .ajaxComplete(function (event, request) {
      var messages = $.parseJSON(request.getResponseHeader('X-Messages'));
      if (messages != null) {
        messenger
          .showMessages(messages)
          .fadeMessages();
      }
    });

  // Fade messages that were already in the HTML.
  messenger.fadeMessages();

})(jQuery, window);
