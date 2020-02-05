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











// var changeDay = function() {
//   var formId    = 'change-day', // フォームのID名
//       yearName  = 'year',       // 年セレクトボックスのname属性値
//       monthName = 'month',      // 月セレクトボックスのname属性値
//       dayName   = 'day',        // 日セレクトボックスのname属性値
//       formObj   = document.getElementById(formId);

//   if (formObj) return false;

//   var yearObj  = formObj[yearName],
//       monthObj = formObj[monthName],
//       dayObj   = formObj[dayName],
//       selectY  = yearObj.options[yearObj.selectedIndex].value,
//       selectM  = monthObj.options[monthObj.selectedIndex].value,
//       selectD  = dayObj.options[dayObj.selectedIndex].value,
//       dateObj  = new Date(selectY, selectM, 0),
//       maxDays  = dateObj.getDate();

//   dayObj.length = 0;

//   for (var i = 1; i <= maxDays; i++) {
//       dayObj.options[i] = new Option(i, i);
//   }

//   dayObj.removeChild(dayObj.options[0]);

//   if (selectD > dayObj.length) {
//       dayObj.options[dayObj.length - 1].selected = true;
//   } else {
//       dayObj.options[selectD - 1].selected = true;
//   }

//   return true;
// };
// var yearSelect  = document.getElementById('year'),
//     monthSelect = document.getElementById('month');
//  
// yearSelect.onchange = function() {
//     changeDay();
// };
//  
// monthSelect.onchange = function() {
//     changeDay();
// };