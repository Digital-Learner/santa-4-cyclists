$(function() {

  // $('.amazon_list .btn').click(function() {
  //   alert('Sorry you cannot save this to your list currently, its a new feature coming soon');

  // });
  $('.amazon_list .btn').click(function() {
    $.post('/items', { item: { name: $('a').val() } })
    .done(function(data) {
      alert('New feature coming soon ' + $('.title').text());
    });
  });

    // url: $('a').html(data);

})

