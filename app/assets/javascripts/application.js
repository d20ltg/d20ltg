// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require ckeditor-jquery
//= require jquery-ui/datepicker
//= require bxslider
//= require turbolinks
//= require bootstrap-sprockets
//= require blueimp-gallery-all
//= require_tree .

$(document).ready(function() {

  $("#day_picked").datepicker({
    dateFormat: 'yy-mm-dd'
  });

  $('.cal-tooltip').tooltip();

  $('.ckeditor').ckeditor({
      // optional config
  });
});

$(document).on("ready page:change", function() {
  $('.cal-tooltip').tooltip();
});


