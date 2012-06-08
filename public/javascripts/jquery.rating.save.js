$(document).ready(function() {
  // Hides the submit button
  $('.new_rating').children('input[type=submit]').addClass('hide');

  // Submits the form (saves data) after user makes a change.
  $('.star').click(function(){
        form = $(this).parent().parent();
        form[0].submit();
    });
});