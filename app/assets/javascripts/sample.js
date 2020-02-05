function monthday(year,month){
  var lastday = new Array('', 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
      lastday[2] = 29;
  }
  return lastday[month];
}
function setDay(){
  var year    = $('#year').val();
  var month   = $('#month').val();
  var day     = $('#day').val();
  var lastday = monthday(year, month);
  var option = '';
  for (var i = 1; i <= lastday; i++) {
      if (i == day){
          option += '<option value="' + zeroPadding(i,2) + '" selected="selected">' + zeroPadding(i,2) + '</option>\n';
      }else{
          option += '<option value="' + zeroPadding(i,2) + '">' + zeroPadding(i,2) + '</option>\n';
      }
  }
  $('#day').html(option);
}

$('#year').change(function(){
  setDay();
});
$('#month').change(function(){
  setDay();
});
