$(function() {
  $('.amazon_list .btn-to-saddlebag').click(function(event) {

    // determine the user is logged in or not
    var logged_in = '';

    logged_in = $('header nav ul li').find('.registration').text();
    if (logged_in === 'Registration') {
      alert('Please login to save to Santa\'s Saddlebag');
    } else {
      // alert('logged in? ' + logged_in);
      //   // alert('New feature coming soon ' + $(this).parent().parent().find('li.url input').val());
      $.post('/items', { item: { name: $(this).parents('.amazon_list').find('li.name').text(), url: $(this).parent().parent().find('li.url input').val() } })
      .done(function(data) {
        alert('Santa has added ' + $(event.target).parents('.amazon_list').find('li.name').text() + ' to his bulging saddlebag');
        // how to redirect, remember to make it relative with a '/'
        // window.location = '/login'
        // alert('New feature coming soon ' + data([:item][:name]));
      });
    }

  });
  $('.btn-register').click(function(e) {
    // alert("Register");
    e.modal("<div><h1>SimpleModal</h1></div>")
  });
})

