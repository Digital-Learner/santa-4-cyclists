$(function() {
  $('.amazon_list .btn-to-saddlebag').click(function(event) {
    var logged_in = '';

    logged_in = $('header nav ul li').find('.registration').text();
    if (logged_in === 'Registration') {
      $('.not_logged_in').click();
      
    } else {
      $.post('/items', { item: { name: $(this).parents('.amazon_list').find('li.name').text(), url: $(this).parent().parent().find('li.url input').val() } })
      .done(function(data) {
        alert('Santa has added ' + $(event.target).parents('.amazon_list').find('li.name').text() + ' to his bulging saddlebag');
      });
    }
  });
  $('.btn-register').click(function(e) {
    // alert("Register");
    e.modal("<div><h1>SimpleModal</h1></div>")
  });
})

