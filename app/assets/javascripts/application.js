//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(function(){
  $('.popsover').hover(function(){
    $this = $(this);

    $this.data('hovering', true);

    $.getJSON('/info/' + $(this).data('username'), function (json) {
      if (!$this.data('hovering')) {
        return
      }

      $this.popover({
        title: json.screen_name,
        content: '#' + json.tweets_count + ' tweets<br/> #' + json.followers_count + ' followers',
        placement: 'bottom',
        html: true,
      }).popover('show');
    });
  }, function() {
    $this = $(this);

    $this.data('hovering', false);
    $this.popover('hide');
  });
});
