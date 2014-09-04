//= require seedrandom
//= require d3
//= require ./graph
//= require ./logo
//= require ./form

(function ($, gon, window, undefined) {

  'use strict';

  var graph = new window.Graph('#graph'),
      logo  = new window.Logo('#modal .logo'),
      form  = new window.Form('#modal form', 'candidate');

  // Initialize graph.
  graph
    .addRoles(gon.roles)
    .addCandidates(gon.candidates)
    .start();

  logo
    // On click...
    .onClick(function () {
      // ... toggle fullscreen mode.
      window.toggleFullScreen();
    });

  form
    // Before the request...
    .onBefore(function () {
      // ... clear all previous errors.
      form.clearErrors();
    })
    // On success...
    .onSuccess(function (event, candidate) {
      // ... reset the form...
      form.reset();
      // ... and add the new candidate to the graph.
      graph
        .addCandidate(candidate)
        .start();
    })
    // On error...
    .onError(function (event, xhr) {
      // ... parse the list of errors...
      var response = $.parseJSON(xhr.responseText),
          errors   = (response != null) ? response.errors : null;
      // ... and display them.
      if (errors != null) {
        form.showErrors(errors);
      }
    });

})(jQuery, gon, window);
