$(function() {
  $('.amazon_list .btn-to-saddlebag').click(function(event) {
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
})



