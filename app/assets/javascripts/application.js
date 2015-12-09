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
//= require jquery-ui
//= require jquery_ujs
//= require jquery.remotipart
//= require jquery.turbolinks
//= require turbolinks
//= require dropzone
//= require_tree .


$(document).ready(function(){
	// disable auto discover
	Dropzone.autoDiscover = false;

	var dropzone = new Dropzone (".dropzone", {
		maxFilesize: 256, // Set the maximum file size to 256 MB
		paramName: "image[picture]", // Rails expects the file upload to be something like model[field_name]
		addRemoveLinks: true, // Don't show remove links on dropzone itself.
		autoProcessQueue: false,
	  // uploadMultiple: true,
	  // parallelUploads: 100,
		// previewsContainer: "image-preview",
		clickable: ".drop-image-field",
	  maxFiles: 1,

		// The setting up of the dropzone
	  init: function() {
	    var myDropzone = this;

	    // First change the button to actually tell Dropzone to process the queue.
	    this.element.querySelector("input[type=submit]").addEventListener("click", function(e) {
	      // Make sure that the form isn't actually being sent.
	      e.preventDefault();
	      e.stopPropagation();
	      myDropzone.processQueue();
	    });

	    // Listen to the sendingmultiple event. In this case, it's the sendingmultiple event instead
	    // of the sending event because uploadMultiple is set to true.
	    this.on("sendingmultiple", function() {
	      // Gets triggered when the form is actually being sent.
	      // Hide the success button or the complete form.
	    });
	    // this.on("successmultiple", function(files, response) {
			// 	this.removeFile(files);
			// 	$.getScript("images");
			// 	alert("response");
	    // });
	    this.on("errormultiple", function(files, response) {
	      // Gets triggered when there was an error sending the files.
	      // Maybe show form again, and notify user of error
	    });
	  }
	});

	dropzone.on("success", function(file) {
		this.removeFile(file);
		$.getScript("images");
		$(".drop-image-field").show();
	})

	dropzone.on("addedfile", function() {
		$(".drop-image-field").hide();
	})

});

var setRadius = function(radius, value) {
  $('#radius-select').text(radius);
  $('#radius-value').val(value);
}

var hideEditForm = function (id, section) {
  $('#edit-' + section + '-' + id).slideUp(350);
}
