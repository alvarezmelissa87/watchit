
$(document).ready(function() {
  $('li a').on('click', longSynopsis)
});

function longSynopsis(e) {
  e.preventDefault();
  $('.short_synopsis').addClass("hidden")
  $('.long').removeClass("hidden")
}

// function something(e) {
//   e.preventDefault;
//   $(this.short_synopsis).hide
// }




