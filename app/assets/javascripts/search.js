$(function() {
  $('.amazon_list .btn-to-saddlebag').click(function(event) {
      // alert('New feature coming soon ' + $(this).parent().parent().find('li.url input').val());
    $.post('/items', { item: { name: $(this).parents('.amazon_list').find('li.name').text(), url: $(this).parent().parent().find('li.url input').val() } })
    .done(function(data) {
      alert('New feature coming soon ' + $(event.target).parents('.amazon_list').find('li.name').text());
      // alert('New feature coming soon ' + data([:item][:name]));
    });
  });
})

