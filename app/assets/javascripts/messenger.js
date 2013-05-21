(function ($, window, undefined) {

  'use strict';

  // Messenger /////////////////////////////////////////////////////////////////

  function Messenger(selector) {
    this.$messages = $(selector);
  }

  Messenger.prototype.fadeMessages = function () {
    this.$messages.children()
      .delay(5000)
      .fadeOut('slow');

    return this;
  };

  Messenger.prototype.showMessages = function (messages) {
    var $messages = this.$messages;

    $messages.empty();
    $.each(messages, function (type, message) {
      $messages.append(
        $('<div />', {
          'class': 'alert alert-' + type
        , 'html':  message
        })
        .hide()
        .fadeIn('fast')
      );
    });

    return this;
  };

  window.Messenger = Messenger;

})(jQuery, window);
