var Utilities = {
  updateTips: function(t) {
    $( ".validateTips" )    
    .text( t )
    .addClass( "ui-state-highlight" );
  setTimeout(function() {
    tips.removeClass( "ui-state-highlight", 1500 );
  }, 500 );    
  },
  checkLength: function( o, n, min, max ) {
    if ( o.val().length > max || o.val().length < min ) {
      o.addClass( "ui-state-error" );
      Utilities.updateTips( "Length of " + n + " must be between " +
        min + " and " + max + "." );
      return false;
    } else {
      return true;
    }
  },
  // Add a user-defined event to observe if a user is logged in.
  triggerLogIn: function() {
    var e = jQuery.Event('userLoggedIn');
    $('body').trigger(e);
  }
}
