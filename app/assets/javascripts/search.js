$(function() {

  // $('.amazon_list .btn').click(function() {
  //   alert('Sorry you cannot save this to your list currently, its a new feature coming soon');

  // });
  $('.amazon_list .btn').click(function() {
    $.post('/items', { item: { name: $('this').val() } })
    .done(function(data) {
      alert('New feature coming soon' + $('a').val());
    });
  });

    // url: $('a').html(data);

})

