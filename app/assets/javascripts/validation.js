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
 }else if(!card_number.match(/[0-9]/)){
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




// 商品の出品
$(function(){
	$('input:submit[id="item_send"]').click(function(){
		if(!items_input_check()){
			return false;
		}
 });
});

// 入力内容チェックのための関数(送付先)
function items_input_check(){
	var result = true;
 // エラー用装飾のためのクラスリセット
 $('#item_name').removeClass("inp_error");
 $('#item_detail').removeClass("inp_error");
 $('#parent_category').removeClass("inp_error");
 $('#status').removeClass("inp_error");
 $('#item_mail').removeClass("inp_error");
 $('#item_prefecture_id').removeClass("inp_error");
 $('#item_arrival_date_id').removeClass("inp_error");
 $('#item_price').removeClass("inp_error");

 // 入力エラー文をリセット
 $("#img_error").empty();
 $("#item_name_error").empty();
 $("#item_detail_error").empty();
 $("#category_error").empty();
 $("#status_error").empty();
 $("#burden_select_error").empty();
 $("#mail_way_error").empty();
 $("#item_prefecture_error").empty();
 $("#arrival_date_error").empty();
 $("#price_error").empty();

	// 入力内容セット
 var item_name = $("#item_name").val();
 var item_detail = $("#item_detail").val();
 var parent_category = $("#parent_category").val();
 var status = $("#status").val();
 var item_mail = $("#item_mail").val();
 var item_prefecture_id = $("#item_prefecture_id").val();
 var item_mail = $("#item_mail").val();
 var item_arrival_date_id = $("#item_arrival_date_id").val();
 var item_price = $("#item_price").val();
 var img = $("#img-file").val();

 // 入力内容チェック
 //画像
	if(img == ""){
		$("#img_error").html("　*出品画像は必須です。");
		$("#image-box-1").addClass("inp_error");
		result = false;
 }
	// 商品名
	if(item_name == ""){
		$("#item_name_error").html("　*商品名は必須です。");
		$("#item_name").addClass("inp_error");
		result = false;
 }
 //商品の説明
 if(item_detail == ""){
		$("#item_detail_error").html("　*商品の説明は必須です。");
		$("#item_detail_name").addClass("inp_error");
		result = false;
	}
 //カテゴリー
 if(parent_category == "---"){
		$("#category_error").html("　*カテゴリーを選択してください。");
		$("#parent_category").addClass("inp_error");
		result = false;
 }else{  //子カテゴリーのチェック
  var child_category = $("#child_category").val();
  if(child_category == "---"){
   $("#category_error").html("　*二番目のカテゴリーを選択してください。");
   $("#child_category").addClass("inp_error");
   result = false;
  }else{  //孫カテゴリーのチェック
   var grandchild_category = $("#grandchild_category").val()
   if(grandchild_category == "---"){
    $("#category_error").html("　*三番目のカテゴリーを選択してください。");
    $("#grandchild_category").addClass("inp_error");
    result = false;
   }
  }
 }
 //商品の状態
 if(status == "nothing"){
		$("#status_error").html("　*商品の状態を選択してください。");
		$("#status").addClass("inp_error");
		result = false;
	}
 //配送料の負担
 if(item_mail == ""){
		$("#burden_select_error").html("　*配送料の負担を選択してください。");
		$("#item_mail").addClass("inp_error");
		result = false;
	}else{
  var item_mail_way = $("#item_mail_way").val();
  if(item_mail_way == ""){
   $("#mail_way_error").html("　*配送の方法を選択してください。");
   $("#item_mail_way").addClass("inp_error");
   result = false;
  }
 }
	// 発送元の地域
 if(item_prefecture_id == ""){
		$("#item_prefecture_error").html("　*発送元の地域を選択してください。");
		$("#item_prefecture_id").addClass("inp_error");
		result = false;
 }
 // 発送までの日数
 if(item_arrival_date_id == ""){
		$("#arrival_date_error").html("　*発送までの日数を選択してください。");
		$("#item_arrival_date_id").addClass("inp_error");
		result = false;
 }
// 価格
 if(item_price == "" ){
		$("#price_error").html("　*価格を入力してください。");
		$("#item_price").addClass("inp_error");
		result = false;
 }else if(!item_price.match(/[0-9]/)){
		$("#price_error").html("　*半角数字で入力してください。");
		$("#item_price").addClass("inp_error");
		result = false;
	}else if(item_price <300){
		$("#price_error").html("　*300円以上で入力してください。");
		$("#item_price").addClass("inp_error");
		result = false;
	}
	return result;
}