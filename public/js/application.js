$(document).ready(function() {
  $('.movie_container').on('click', 'li a', showSynopsis)
});

function showSynopsis(e) {
  e.preventDefault;
  var ajaxRequest = $.ajax({
    url: '/',
    type: 'GET',
  })
  ajaxRequest.done(longSynopsis);
}

function longSynopsis(data) {
  $('.short_synopsis').addClass("hidden")
  $('.long').removeClass("hidden")
}