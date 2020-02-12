$(function(){
//ボックスのオプションを作成
  function appendMailOption(mail){
   var html = `<option value="${mail.txt}" data-mail="${mail.val}">${mail.txt}</option>`;
   return html;
  }

//配送方法の表示
  function appendMailBox(insertHtml){
   var mailSelectHtml = '';
   mailSelectHtml = `<div class="form-group" id= 'postage_wrapper'>
                       <label>
                         配送の方法
                         <span class="form-group__require">
                           必須
                         </span>
                       </label>
                       <div class="select-wrap">
                         <select name="item[mail_way]" id="item_mail_way">
                           <option value="">
                             ---
                           </option>
                           ${insertHtml}
                         </select>
                       </div>
                     </div>`;
   $('.content__mail-box').append(mailSelectHtml);
  }
  
  var arr = [
   {val:"1", txt:"未定"},
   {val:"2", txt:"クロネコヤマト"},
   {val:"3", txt:"ゆうパック"},
   {val:"4", txt:"ゆうメール"},
   {val:"5", txt:"ゆうパケット"},
   {val:"6", txt:"らくらくメルカリ便"},
   {val:"7", txt:"普通郵便(定形、定形外)"},
   {val:"8", txt:"レターパック"},
   {val:"9", txt:"クリックポスト"}
  ];

  
//配送負担を選択後
  $('#item_mail').on('change', function(){
   var sendContent = document.getElementById('item_mail').value; //選択された情報を取得
   if (sendContent == "送料込み(出品者負担)"){    //発送負担が出品者である事を確認
     $('#postage_wrapper').remove();
     var insertHTML = '';
     for(var i=0;i<arr.length;i++){
       insertHTML += appendMailOption(arr[i]);
     };
     appendMailBox(insertHTML);
   }else if(sendContent == "着払い(購入者負担)"){
    $('#postage_wrapper').remove();
    var insertHTML = '';
    for(var i=0;i<4;i++){
      insertHTML += appendMailOption(arr[i]);
    };
    appendMailBox(insertHTML);
   }else{
     $('#postage_wrapper').remove(); 
   }
  });
});