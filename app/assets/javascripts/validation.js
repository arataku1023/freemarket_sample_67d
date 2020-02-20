 // ユーザー登録
$(function(){
	$('input:submit[id="btn_submit"]').click(function(){
		if(!user_input_check()){
			return false;
		}
 });
 $('button[class="close"]').click(function(){
   $('.alert').empty();
 });
});

// 入力内容チェックのための関数(ユーザー)
function user_input_check(){
	var result = true;
 // エラー用装飾のためのクラスリセット
 $('#nickname').removeClass("inp_error");
 $('#mailaddress').removeClass("inp_error");
 $('#passwords').removeClass("inp_error");
 $('#pass_confirm').removeClass("inp_error");
 $('#zenkaku').removeClass("inp_error");
 $('#furigana').removeClass("inp_error");
 $('#birth').removeClass("inp_error");

	// 入力エラー文をリセット
 $("#nickname_error").empty();
 $("#mailaddress_error").empty();
 $("#passwords_error").empty();
 $("#pass_confirm_error").empty();
 $("#zenkaku_error").empty();
 $("#furigana_error").empty();
 $("#birth_error").empty();

	// 入力内容セット
 var nickname   = $("#nickname").val();
 var mailaddress  = $("#mailaddress").val();
 var passwords = $("#passwords").val();
 var pass_confirm  = $("#pass_confirm").val();
 var zenkaku_last  = $("#zenkaku_last").val();
 var zenkaku_first = $("#zenkaku_first").val();
 var furigana_last  = $("#furigana_last").val();
 var furigana_first  = $("#furigana_first").val();
 var birth_year   = $("#user_birth_year").val();
 var birth_month   = $("#user_birth_month").val();
 var birth_day   = $("#user_birth_day").val();

	// 入力内容チェック
	// ニックネーム
	if(nickname == ""){
		$("#nickname_error").html("　*お名前は必須です。");
		$("#nickname").addClass("inp_error");
		result = false;
	}else if(nickname.length > 25){
		$("#nickname_error").html("　*お名前は25文字以内で入力してください。");
		$("#nickname").addClass("inp_error");
		result = false;
 }
 // メールアドレス
 if(mailaddress == ""){
  $("#mailaddress_error").html("　*メールアドレスは必須です。");
  $("#mailaddress").addClass("inp_error");
  result = false;
 }else if(!mailaddress.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
  $('#mailaddress_error').html("　*正しいメールアドレスを入力してください。");
  $("#mailaddress").addClass("inp_error");
  result = false;
 }else if(mailaddress.length > 255){
  $('#mailaddress_error').html("　*正しいメールアドレスを入力してください。");
  $("#mailaddress").addClass("inp_error");
  result = false;
 }
 //パスワード
 if(passwords == ""){
  $("#passwords_error").html("　*パスワードは必須です。");
  $("#passwords").addClass("inp_error");
  result = false;
 }else if(passwords.length < 7){
  $("#passwords_error").html("　*パスワードは7文字以上で入力してください。");
  $("#passwords").addClass("inp_error");
  result = false;
 }
 //確認
 if(pass_confirm == ""){
  $("#pass_confirm_error").html("　*確認用パスワードは必須です。");
  $("#pass_confirm").addClass("inp_error");
  result = false;
 }else if(pass_confirm.length < 7){
  $("#pass_confirm_error").html("　*確認用パスワードは7文字上で入力してください。");
  $("#pass_confirm").addClass("inp_error");
  result = false;
 }
 //全角
 if(zenkaku_last == "" || zenkaku_first == ""){
  $("#zenkaku_error").html("　*お名前は必須です。");
  $("#zenkaku").addClass("inp_error");
  result = false;
 }else if(!zenkaku_last.match(/[^\x01-\x7E]/) || !zenkaku_first.match(/[^\x01-\x7E]/)){
  $("#zenkaku_error").html("　*お名前は全角で入力してください。");
  $("#zenkaku").addClass("inp_error");
  result = false;
 }else if(zenkaku_last.length > 25 || zenkaku_first.length > 25){
  $("#zenkaku_error").html("　*お名前は25文字以内入力してください。");
  $("#zenkaku").addClass("inp_error");
  result = false;
 }
  // フリガナ
	if((furigana_last == "") || (furigana_first == "")){
		$("#furigana_error").html("　*フリガナは必須です。");
		$("#furigana").addClass("inp_error");
		result = false;
	}else if((!furigana_last.match(/^[ァ-ロワヲンー 　\r\n\t]*$/)) || (!furigana_first.match(/^[ァ-ロワヲンー 　\r\n\t]*$/))){
		$("#furigana_error").html("　*フリガナは全角カタカナで入力してください。");
		$("#furigana").addClass("inp_error");
		result = false;
	}else if((furigana_last.length > 25) || (furigana_first.length > 25)){
		$("#furigana_error").html("　*フリガナは25文字以内入力してください。");
		$("#furigana").addClass("inp_error");
		result = false;
	}
	// 生年月日
	if((birth_year == "") || (birth_month == "") || (birth_day == "")){
		$("#birth_error").html("　*生年月日を選択してください。");
		$("#birth").addClass("inp_error");
		result = false;
	}
	return result;
}




// 送付先の登録
$(function(){
	$('input:submit[id="btn_submit_address"]').click(function(){
		if(!address_input_check()){
			return false;
		}
 });
});

// 入力内容チェックのための関数(送付先)
function address_input_check(){
	var result = true;
 // エラー用装飾のためのクラスリセット
 $('#postcodes').removeClass("inp_error");
 $('#address_prefectures').removeClass("inp_error");
 $('#town').removeClass("inp_error");
 $('#address_num').removeClass("inp_error");
 $('#tel').removeClass("inp_error");

	// 入力エラー文をリセット
 $("#postcodes_error").empty();
 $("#address_prefectures_error").empty();
 $("#town_error").empty();
 $("#address_num_error").empty();
 $("#tel_error").empty();

	// 入力内容セット
 var postcodes = $("#postcodes").val();
 var address_prefecture = $("#address_prefectures").val();
 var town = $("#town").val();
 var address_num = $("#address_num").val();
 var tel = $("#tel").val();


	// 入力内容チェック
	// 郵便番号
	if(postcodes == ""){
		$("#postcodes_error").html("　*郵便番号は必須です。");
		$("#postcodes").addClass("inp_error");
		result = false;
	}else if(!postcodes.match(/^[0-9]+$/)){
		$("#postcodes_error").html("　*郵便番号は半角数字で入力してください。");
		$("#postcodes").addClass("inp_error");
		result = false;
 }else if(!postcodes.length == 7){
		$("#postcodes_error").html("　*郵便番号は7文字で入力してください。");
		$("#postcodes").addClass("inp_error");
		result = false;
 }
 //送付先の都道府県
 if(address_prefecture == ""){
		$("#address_prefectures_error").html("　*都道府県を選択してください。");
		$("#address_prefectures").addClass("inp_error");
		result = false;
 }
 //市区町村
 if(town == ""){
		$("#town_error").html("　*市区町村は必須です。");
		$("#town").addClass("inp_error");
		result = false;
	}else if(town.match(/\A[一-龥ぁ-ん]/)){
  $("#town_error").html("　*市区町村は全角(平仮名・漢字)で入力してください。");
		$("#town").addClass("inp_error");
		result = false;
 }else if((furigana_last.length > 25) || (furigana_first.length > 25)){
		$("#furigana_error").html("　*フリガナは25文字以内入力してください。");
		$("#furigana").addClass("inp_error");
		result = false;
	}
 //番地
 if(address_num == ""){
		$("#address_num_error").html("　*番地は必須です。");
		$("#town").addClass("inp_error");
		result = false;
	}else if((town.match(/\A[a-zA-Z0-9]+\z/)) || (town.match(/[！-／：-＠［-｀｛-～、-〜”’・]+/g))){
  $("#town_error").html("　*番地を正しく入力してください。");
		$("#town").addClass("inp_error");  //機能してない
		result = false;
 }else if(town.length > 25){
		$("#town_error").html("　*番地は25文字以内入力してください。");
		$("#town").addClass("inp_error");
		result = false;
	}
	// 電話番号
 if((!tel.match(/^[0-9]+$/)) && (tel.length > 1)){
		$('#tel_error').html(" 正しい電話番号を入力してください。");
		$("#tel").addClass("inp_error");
		result = false;
	}

	return result;
}




// クレカ入力
$(function(){
	$('input:submit[id="token_submit"]').click(function(){
		if(!card_input_check()){
			return false;
		}
 });
});

// 入力内容チェックのための関数(クレカ)
function card_input_check(){
	var result = true;
 // エラー用装飾のためのクラスリセット
 $('#card_number').removeClass("inp_error");
 $('#exp_month').removeClass("inp_error");
 $('#exp_year').removeClass("inp_error");
 $('#cvc').removeClass("inp_error");

	// 入力エラー文をリセット
 $("#card_number_error").empty();
 $("#exp_date_error").empty();
 $("#cvc_error").empty();

	// 入力内容セット
 var card_number = $("#card_number").val();
 var exp_month = $("#exp_month").val();
 var exp_year = $("#exp_year").val();
 var cvc = $("#cvc").val();

	// 入力内容チェック
 //有効期限
 if((exp_month == "") || (exp_year == "")){
		$("#exp_date_error").html("　*有効期限を選択してください。");
  $("#exp_date").addClass("inp_error");
		result = false;
 }

 //セキュリティーコード
 if(cvc == ""){
		$("#cvc_error").html("　*セキュリティーコードは必須です。");
		$("#cvc").addClass("inp_error");
		result = false;
	}else if(!cvc.match(/^([0-9])$/)){
  $("#cvc_error").html("　*半角数字で入力してください。");
		$("#cvc").addClass("inp_error");
		result = false;
 }
	// カード番号
	if(card_number == ""){
		$("#card_number_error").html("　*カード番号は必須です。");
		$("#card_number").addClass("inp_error");
		result = false;
 }else if(!card_number.match(/^([0-9])$/)){
  $("#card_number_error").html("　*半角数字で入力してください。");
		$("#card_number").addClass("inp_error");
		result = false;
 }
 //次の全てを許可VISA・MasterCard・DiscoverCard・DinersClub・AmericanExpress・JCB Card
 // else if(!postcodes.match(/(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47]{13}|(?:2131|1800|35[0-9]{3})[0-9]{11})/)){
	// 	$("#card_error").html("　*カード番号を正しく入力してください。");
	// 	$("#card").addClass("inp_error");
	// 	result = false;
 // }     
	return result;
}