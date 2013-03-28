$(function() {

  // $('.amazon_list .btn').click(function() {
  //   alert('Sorry you cannot save this to your list currently, its a new feature coming soon');

  // });
  $('.amazon_list .btn').click(function() {
    $.post('/items', {}, function(data) {
    url: $('a').html(data);
  });
  });


})

