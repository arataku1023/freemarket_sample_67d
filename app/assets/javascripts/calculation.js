$(function() {
  $(".amount-input").on("keyup", function() {
    var input = $(".amount-input").val();
    input = parseInt(input);
    if(input >= 300 && input <= 9999999) {
    var fee = Math.floor(input * 0.1)
    var total_amount = (input + fee)
    $('.fee').html(fee.toLocaleString())
    $('.fee').prepend('¥')
    $('.total_amount').html(total_amount.toLocaleString())
    $('.total_amount').prepend('¥')
    }
    else{
    $('.fee').html("-")
    $('.total_amount').html("-")
    }
  });
});