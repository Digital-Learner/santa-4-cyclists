$(function() {
// $(document).on('click', '.loaded-via-ajax', function(){
//     alert($(this).attr('id'));
// });

  $(document).on('click', '.amazon_list .btn-to-saddlebag', function(event) {
    alert('u wanna add this to Santa\'s sac?');
    var logged_in = '';
    var name = $(this).parents('.amazon_list').find('li.name').text();
    var url = $(this).parent().parent().find('li.url input').val();
    var addToBag = function(name, url) {
      $.post('/items', { item: { name: name, url: url } })
      .done(function(data) {
        alert('Santa has added ' + name + ' to his bulging saddlebag');
      });
    }

    logged_in = $('header nav ul li').find('.registration').text();
    if (logged_in === 'Registration') {
      $('.not_logged_in').click();
      $('body').on("userLoggedIn", function() { addToBag(name, url) });
    } else {
      addToBag(name, url);
    }
  });
});
  
  // Add functionality for searching via AJAX
$(function() {
  $('#product-search-box').on('submit', function(e) {
    e.preventDefault();
    // debugger;
    var search_string = $(this).find('#q').val();
    var params = { q : search_string };
    console.log (params);
    var callback = function(data, status, xhr) {
      console.log (data);
      console.log (status);
      console.log (xhr);
      alert(status);
      $('.inner-container').html(data);
    }
    $.get('/search', params, callback, "html");
  });
    // $.get(URL,data,function(data,status,xhr),dataType)
    // URL Required. Specifies the URL you wish to request
    // data  Optional. Specifies data to send to the server along with the request
    // function(data,status,xhr)  Optional. Specifies a function to run if the request succeeds
    // Additional parameters:
    // data - contains the resulting data from the request
    // status - contains the status of the request ("success", "notmodified", "error", "timeout", or "parsererror")
    // xhr - contains the XMLHttpRequest object
    // dataType   Optional. Specifies the data type expected of the server response.
    // By default jQuery performs an automatic guess.
    // Possible types:
    // "xml" - An XML document
    // "html" - HTML as plain text
    // "text" - A plain text string
    // "script" - Runs the response as JavaScript, and returns it as plain text
    // "json" - Runs the response as JSON, and returns a JavaScript object
    // "jsonp" - Loads in a JSON block using JSONP. Will add an "?callback=?" to the URL to specify the callback

});

