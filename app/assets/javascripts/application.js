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
//= require_tree .

$(function(){
  var name = $( "#name" ),
  email = $( "#email" ),
  password = $( "#password" ),
  password_confirmation = $( "#password_confirmation" ),
  allFields = $( [] ).add( name ).add( email ).add( password ).add( password_confirmation ),
  tips = $( ".validateTips" );

  function updateTips( t ) {
    tips
      .text( t )
      .addClass( "ui-state-highlight" );
    // setTimeout(function() {
    //   tips.removeClass( "ui-state-highlight", 1500 );
    // }, 500 );
  }

  function checkLength( o, n, min, max ) {
    if ( o.val().length > max || o.val().length < min ) {
      o.addClass( "ui-state-error" );
      updateTips( "Length of " + n + " must be between " +
        min + " and " + max + "." );
      return false;
    } else {
      return true;
    }
  }

  $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 575,
    width: 350,
    modal: true,
    buttons: {
      "Register": function() {
        var bValid = true;
          allFields.removeClass( "ui-state-error" );

          bValid = bValid && checkLength( name, "username", 1, 25 );
          bValid = bValid && checkLength( email, "email", 6, 80 );
          bValid = bValid && checkLength( password, "password", 6, 16 );
          bValid = bValid && checkLength( password_confirmation, "password_confirmation", 6, 16 );

        if ( bValid ) {
          var params = { user: { name: name.val(), email: email.val(), password: password.val(), password_confirmation: password_confirmation.val() } };
          var callback = function() {
            window.location = '/';
          }
          $.post('/users', params, callback);
        }
      }
    }
  });
  $('.registration').click(function(e) {
    e.preventDefault();
    $( "#dialog-form" ).dialog("open");
  });
});
