(function ($, window, undefined) {

  'use strict';

  // Form //////////////////////////////////////////////////////////////////////

  function Form(selector, model) {
    this.$form = $(selector);
    this.model = model;
  }

  Form.prototype.reset = function () {
    this.$form.get(0).reset();

    return this;
  };

  Form.prototype.showErrors = function (errors) {
    var $form = this.$form,
        model = this.model;

    // For each error...
    $.each(errors, function (field, error) {
      var id = model + '_' + field,
          $group = $form.find('.' + id),
          $field = $form.find('#' + id);
      // ... mark the group corresponding to that field...
      $group.addClass('error');
      // ... and add an error message.
      $field.after(
        $('<span/>', {
          'class': 'help-block',
          'text':  error
        })
      );
    });

    return this;
  };

  Form.prototype.clearErrors = function () {
    var $form   = this.$form,
        $groups = $form.find('.control-group.error'),
        $errors = $groups.find('.help-block');

    // Unmark all groups...
    $groups.removeClass('error');
    // ... and remove all error messages.
    $errors.remove();

    return this;
  };

  Form.prototype.onBefore = function (callback) {
    this.$form.on('ajax:before', callback);

    return this;
  };

  Form.prototype.onSuccess = function (callback) {
    this.$form.on('ajax:success', callback);

    return this;
  };

  Form.prototype.onError = function (callback) {
    this.$form.on('ajax:error', callback);

    return this;
  };

  window.Form = Form;

})(jQuery, window);
