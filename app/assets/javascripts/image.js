$(function(){
 $('#1').mouseover(function(){
   $('.relative').css('left', '0'),$(this).css('opacity','1'),$('#2').css('opacity','0.6'),$('#3').css('opacity','0.6');
 }),
 $('#2').mouseover(function(){
   $('.relative').css('left', '-620px'),$(this).css('opacity','1'),$('#3').css('opacity','0.6'),$('#1').css('opacity','0.6');
 }),
 $('#3').mouseover(function(){
   $('.relative').css('left', '-1240px'),$(this).css('opacity','1'),$('#2').css('opacity','0.6'),$('#1').css('opacity','0.6');
 });
});