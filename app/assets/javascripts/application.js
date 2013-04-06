// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require utilities
//= require_tree .

$(document).ajaxComplete(function(event, request){
  event.preventDefault();
  $('div.alert').remove();
  var flash = $.parseJSON(request.getResponseHeader('X-Flash-Messages'));
  if(!flash) return;
  console.log( flash )
  // if(flash.notice) { /* code to display the 'notice' flash */ $('.alert .alert-notice').html(flash.notice); }
  if(flash.error) { 
    $('.container').prepend('<div class="alert alert-error"></div>');
    $('.alert').html(flash.error); 
  }

  // if(flash.error) {  code to display the 'error' flash  alert(flash.error); }
  //so forth
});

