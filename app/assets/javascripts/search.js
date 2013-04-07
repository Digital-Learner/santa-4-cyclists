// Add item to Santa's Sack
$(function() {
  $(document).on('click', '.amazon_list .btn-to-saddlebag', function(event) {
    event.preventDefault();
    var clickedItem = $(this);
    var logged_in = '';
    var name = $(this).parents('.amazon_list').find('li.name').text();
    var url = $(this).parent().parent().find('li.url input').val();
    var toggleLink = function() {
      $(clickedItem).removeClass('btn-to-saddlebag').addClass('btn-remove-from-saddlebag'),
      $(clickedItem).html("Santa's Saddlebag<span class='btn-remove'>&nbsp;-&nbsp;</span>");
    }
    var addToBag = function(name, url) {
      $.post( '/items', 
              { item: { name: name, url: url } }
            )
      .success(function(data) {
        toggleLink();
       });
      // .done(function(data) {
      //   // would like to use Flash in here, how do we do this?
      //   alert('Santa has added ' + name + ' to his bulging saddlebag');
      // });
    }

    logged_in = $('header nav ul li').find('.registration').text();
    if (logged_in === 'Registration') {
      $('.not_logged_in').click();
      $('body').on("userLoggedIn", function() { addToBag(name, url) });
    } else { addToBag(name, url) }
    // $(this).addClass('btn-has-been-added');
    // var linkAddRemoveString = $('.add a:first').text();
    // alert(linkAddRemoveString);
  });
});

// Remove Item from Santa's Sack
$(function() {
  $(document).on('click', '.amazon_list .btn-remove-from-saddlebag', function(event) {
    event.preventDefault();
    var removeItem = $(this).attr('url');
    var name = $(this).parents('.amazon_list').find('li.name').text();
    var removeItemURL = $(this).parent().parent().find('li.url input').val();
    var clickedItem = $(this);

    if ( confirm("Are you sure you want to delete this Item?") )
      $.ajax({
        url: "/items/" + name,
        type: "post",
        dataType: "json",
        data: {"_method":"delete"}
      }).success(function(data) {
          $(clickedItem).removeClass('btn-remove-from-saddlebag').addClass('btn-to-saddlebag');
          $(clickedItem).html("Santa's Saddlebag<span class='btn-plus'>&nbsp;+&nbsp;</span>");
        });
    return false;
  });
});

  
  // Add functionality for searching via AJAX
$(function() {
  $('#product-search-box').on('submit', function(e) {
    e.preventDefault();
    // debugger;
    var search_string = $(this).find('#q').val();
    var amazonSearchLocale = $('select#aaws_locale_id').val();
    var params = { q : search_string, aAWSlocale : amazonSearchLocale };
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

