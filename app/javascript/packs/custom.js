$(document).on('mouseover', '#new_review .rating .fa-star', function () {
  let rate = $(this).data('star');
  let star_dom = $(this).parent().find('.fa-star');
  star_dom.removeClass('active');
  for (let i = 0; i < rate; i++) {
    star_dom.eq(i).addClass('active');
  }
  $('#review_rating').val(rate);
});
