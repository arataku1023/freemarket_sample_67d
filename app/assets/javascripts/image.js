$(function() {

  $('#0').hover(
    function() {
      $('.relative').css('left', '0'),$('#1').addClass('opa'),$('#2').addClass('opa');
    },
    function() {
      $('.relative').css('left', '0');
    }
  );

  $('#1').hover(
    function() {
      $('.relative').css('left', '-620px'),$(this).removeClass('opa').addClass('active'),$('#0').addClass('opa'),$('#2').addClass('opa');
    },
    function() {
      $('.relative').css('left', '0'),$(this).addClass('opa').removeClass('active'),$('#0').removeClass('opa');
    }
  );

  $("#2").hover(
    function() {
      $('.relative').css('left', '-1240px'),$(this).removeClass('opa'),$(this).addClass('active'),$('#0').addClass('opa'),$('#1').addClass('opa');
    },
    function() {
      $('.relative').css('left', '0'),$(this).addClass('opa').removeClass('active'),$('#0').removeClass('opa');
    }
  );
  $("#3").hover(
    function() {
      $('.relative').css('left', '-1860px'),$(this).removeClass('opa'),$(this).addClass('active'),$('#0').addClass('opa'),$('#1').addClass('opa');
    },
    function() {
      $('.relative').css('left', '0'),$(this).addClass('opa').removeClass('active'),$('#0').removeClass('opa');
    }
  );
  $("#4").hover(
    function() {
      $('.relative').css('left', '-2480px'),$(this).removeClass('opa'),$(this).addClass('active'),$('#0').addClass('opa'),$('#1').addClass('opa');
    },
    function() {
      $('.relative').css('left', '0'),$(this).addClass('opa').removeClass('active'),$('#0').removeClass('opa');
    }
  );
})