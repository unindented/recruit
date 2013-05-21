(function ($, window, undefined) {

  'use strict';

  // Logo //////////////////////////////////////////////////////////////////////

  function Logo(selector) {
    this.$logo = $(selector);
  }

  Logo.prototype.onClick = function (callback) {
    this.$logo.click(callback);

    return this;
  };

  window.Logo = Logo;

})(jQuery, window);
