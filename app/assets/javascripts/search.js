$(function() {
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
      // if (data.html) {
      //   $("#results").html(data.html);
      // } else {
      //   alert(data.aAWSResult);
      // }
      console.log (data);
      console.log (status);
      console.log (xhr);
      // This is the basic way of doing the interrogation of json
      // alert($.parseJSON(data).aAWSResult);
      // $.each($.parseJSON(data), function(idx, val) { alert(idx + "=" + val); });

      if ($.parseJSON(data).aAWSResult === 'notFound') {
        alert("SORRY NO PRESENTS FOR YOU THIS YEAR!");
        $('img#jersey-reverse').hide()
        .replaceWith('<img src="assets/santa-with-empty-sack.jpeg"/>');
      } else {
        $('.inner-container').html(data);
      }
    }
    $.get('/search', params, callback, "html");
    // $.getJSON('/search', params, callback);
    // $('#results').load("/search", params).fail(function() {alert("not found")})
  });
});

