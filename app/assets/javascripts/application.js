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
//= require bootstrap
//= require jquery-ui
//= require jquery_ujs
//= require jquery.remotipart
//= require jquery.turbolinks
//= require turbolinks
//= require dropzone
//= require_tree .


// $(document).ready(function(){
// 	// disable auto discover
// 	Dropzone.autoDiscover = false;
//
// 	var dropzone = new Dropzone (".dropzone", {
// 		maxFilesize: 256, // Set the maximum file size to 256 MB
// 		paramName: "image[picture]", // Rails expects the file upload to be something like model[field_name]
// 		addRemoveLinks: true, // Don't show remove links on dropzone itself.
// 		autoProcessQueue: false,
// 		clickable: ".drop-image-field",
// 	  maxFiles: 1,
//
// 		// The setting up of the dropzone
// 	  init: function() {
// 	    var myDropzone = this;
//
// 	    // First change the button to actually tell Dropzone to process the queue.
// 	    this.element.querySelector("input[type=submit]").addEventListener("click", function(e) {
// 	      // Make sure that the form isn't actually being sent.
// 	      e.preventDefault();
// 	      e.stopPropagation();
// 	      myDropzone.processQueue();
// 	    });
//
// 			this.on("success", function(file) {
// 				this.removeFile(file);
// 				$.getScript("images");
// 				$(".drop-image-field").show();
// 			})
//
// 			this.on("addedfile", function() {
// 				$(".drop-image-field").hide();
// 			})
// 	  }
// 	});
// });

var setRadius = function(radius, value) {
  $('#radius-select').text(radius);
  $('#radius-value').val(value);
}

var hideEditForm = function (id, section) {
  $('#edit-' + section + '-' + id).slideUp(350);
}

(function($) {
    $.fn.parallax = function(options) {
        var windowHeight = $(window).height();
        // Establish default settings
        var settings = $.extend({
            speed        : 0.15
        }, options);
        // Iterate over each object in collection
        return this.each( function() {
        // Save a reference to the element
        var $this = $(this);
        // Set up Scroll Handler
        $(document).scroll(function(){

    var scrollTop = $(window).scrollTop();
            var offset = $this.offset().top;
            var height = $this.outerHeight();

    // Check if above or below viewport
if (offset + height <= scrollTop || offset >= scrollTop + windowHeight) {
return;
}

var yBgPosition = Math.round((offset - scrollTop) * settings.speed);

                // Apply the Y Background Position to Set the Parallax Effect
    $this.css('background-position', 'center ' + yBgPosition + 'px');

        });
        });
    }
}(jQuery));
