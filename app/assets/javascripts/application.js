// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui/draggable
//= require jquery-ui/droppable
//= require jquery-ui/resizable
//= require jquery-ui/selectable
//= require jquery-ui/sortable
//= require turbolinks
//= require_tree .

var setRadius = function(radius, value) {
  $('#radius-select').text(radius);
  $('#radius-value').val(value);
}

$(function() {
    $( "#draggable" ).draggable();
  });

$(function($) {
  var panelList = $('#draggablePanelList');

  panelList.sortable({
      // Only make the .panel-heading child elements support dragging.
      // Omit this to make then entire <li>...</li> draggable.
      handle: '.panel-heading',
      update: function() {
          $('.panel', panelList).each(function(index, elem) {
               var $listItem = $(elem),
                   newIndex = $listItem.index();

               // Persist the new indices.
          });
      }
  });
});
