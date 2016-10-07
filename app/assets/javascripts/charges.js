$(document).ready(function(){
  var $form = $('#charge-form');

  $form.submit(function(event) {
    event.preventDefault();
    $form.find('input:submit').prop('disabled', true);
    Stripe.card.createToken($form, stripeResponseHandler);
  });

  stripeResponseHandler = function(status, response) {
    console.log(status);
    console.log(response);

    var $form = $('#charge-form');
    if (response.error) {
      $form.find('.charge-errors').text(response.error.message);
      $form.find('input:submit').prop('disabled', false);
    } else {

      var token = response.id;

      $("#stripe_token").val(token);

      $("#server-form").submit();
    }
  }

});
