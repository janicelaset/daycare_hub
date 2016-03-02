# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#programList').sortable(
    axis: 'y'
    handle: '.panel-heading'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
      # console.log($(this).data('update-url'));
      # console.log($(this).sortable('serialize'));
  );
