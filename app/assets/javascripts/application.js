// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {
   $(function() {
     $('#big_bottle').crossSlide({
       sleep: 3,
       fade: 1
     }, [
       { src: '/assets/products/pink_4.png' },
       { src: '/assets/products/pink_5.png' },
       { src: '/assets/products/pink_6.png' }
     ])
   });
   
   $("#payment-form").submit(function(event) {
     // disable the submit button to prevent repeated clicks
     $('.submit-button').attr("disabled", "disabled");

     Stripe.createToken({
         number: $('.card-number').val(),
         cvc: $('.card-cvc').val(),
         exp_month: $('.card-expiry-month').val(),
         exp_year: $('.card-expiry-year').val()
     }, stripeResponseHandler);

     // prevent the form from submitting with the default action
     return false;
   });
});

function stripeResponseHandler(status, response) {
    var form$ = $("#payment-form");
    
    if (response.error) {
        // show the errors on the form
        $(".payment-errors").text(response.error.message);
        form$.find('.submit-button').removeAttr("disabled", "disabled");
    } else {
        // token contains id, last4, and card type
        var token = response['id'];
        // insert the token into the form so it gets submitted to the server
        form$.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
        // and submit
        form$.get(0).submit();
    }
}