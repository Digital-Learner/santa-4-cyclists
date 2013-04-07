$(function() {
  $(document).on('click', '.amazon_list .btn-to-saddlebag', function(event) {
    var logged_in = '';
    var name = $(this).parents('.amazon_list').find('li.name').text();
    var url = $(this).parent().parent().find('li.url input').val();
    var addToBag = function(name, url) {
      $.post('/items', { item: { name: name, url: url } })
      // .done(function(data) {
      //   // would like to use Flash in here, how do we do this?
      //   alert('Santa has added ' + name + ' to his bulging saddlebag');
      // });
    }

    logged_in = $('header nav ul li').find('.registration').text();
    if (logged_in === 'Registration') {
      $('.not_logged_in').click();
      $('body').on("userLoggedIn", function() { addToBag(name, url) });
    } else {
      addToBag(name, url);
    }
    // $(this).addClass('btn-has-been-added');
    // var linkAddRemoveString = $('.add a:first').text();
    $(this).html("Santa's Saddlebag  <span class='btn-remove'>&nbsp;-&nbsp;</span>" );
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
    $.get('/search', params, "html")
      .success(function(data) {
        $('.inner-container').html(data);
        var linkAddRemoveString = $('.add a:first').text();
        $('.add a').html(linkAddRemoveString + '<span class="btn-plus">&nbsp;+&nbsp;</span>');
      })
      .error(function(data){
          $('img#jersey-reverse').hide()
          .replaceWith('<img id="jersey-reverse" src="assets/santa-with-empty-sack.jpeg"/>');
      });
    // $.getJSON('/search', params, callback);
    // $('#results').load("/search", params).fail(function() {alert("not found")})
  });
});

