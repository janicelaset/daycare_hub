var setRadius = function(radius, value) {
  $('#radius-select').text(radius);
  $('#radius-value').val(value);
  console.log('set radius');
}

var disableCertInput = function(id) {
  if($('#certification_id').val() === '') {
    $('#certification-edit-name').prop('disabled', false);
    $('#certification-edit-desc').prop('disabled', false);
    console.log('enabled');
  }
  else {
    $('#certification-edit-name').prop('disabled', true);
    $('#certification-edit-desc').prop('disabled', true);
    console.log('disabled');
  }
}

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();

  $(function() {
    $('.edit-section.panel-heading').bind('click',function(){
      var self = this;
      setTimeout(function() {
        theOffset = $(self).offset();
        $('body,html').animate({ scrollTop: theOffset.top - 100 });
      }, 310); // ensure the collapse animation is done
    });
  });
});
