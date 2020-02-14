$(function() {
  $(document).ready(function() {
    var input = $(".amount-input").val();
    input = parseInt(input);
    if(input >= 300 && input <= 9999999) {
    var fee = Math.floor(input * 0.1)
    var total_amount = (input - fee)
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


  // $(function() {
  //   $('#c_category').click(function() {
  //     $('#c_category').remove();
  //     $('#g_category').remove();
  //   });
  //   // $('#g_category').click(function() {
  //   //   $('#c_category').remove();
  //   //   $('#g_category').remove();
  //   // });
  // });


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
      $('#item_mail_way').on('focus', function(){
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


// $(function(){
//  // カテゴリーセレクトボックスのオプションを作成
//  function appendOption(category){
//    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
//    return html;
//  }
//  // 子カテゴリーの表示作成
//  function appendChidrenBox(insertHTML){
//    var childSelectHtml = '';
//    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
//                        <div class='listing-select-wrapper__box'>
//                          <select class="listing-select-wrapper__box--select" id="child_category" name="category_id">
//                            <option value="---" data-category="---">---</option>
//                            ${insertHTML}
//                          <select>
//                        </div>
//                      </div>`;
//    $('.listing-product-detail__category').append(childSelectHtml);
//  }
//  // 孫カテゴリーの表示作成
//  function appendGrandchidrenBox(insertHTML){
//    var grandchildSelectHtml = '';
//    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
//                              <div class='listing-select-wrapper__box'>
//                                <select class="listing-select-wrapper__box--select" id="grandchild_category" name="item[category_id]">
//                                  <option value="---" data-category="---">---</option>
//                                  ${insertHTML}
//                                </select>
//                              </div>
//                            </div>`;
//    $('.listing-product-detail__category').append(grandchildSelectHtml);
//  }
//  // 親カテゴリー選択後のイベント
//  $('#parent_category').on('change', function(){
//    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
//    if (parentCategory != "---"){  //親カテゴリーが初期値でないことを確認
//      $.ajax({
//        url: '/items/get_category_children',
//        type: 'GET',
//        data: { parent_name: parentCategory },
//        dataType: 'json'
//      })
//      .done(function(children){
//        $('#children_wrapper').remove();      //親が変更された時、子以下を削除するする
//        $('#grandchildren_wrapper').remove();
//        $('#size_wrapper').remove();
//        $('#brand_wrapper').remove();
//        var insertHTML = '';
//        children.forEach(function(child){
//          insertHTML += appendOption(child);
//        });
//        appendChidrenBox(insertHTML);
//      })
//      .fail(function(){
//        alert('カテゴリー取得に失敗しました');
//      })
//    }else{
//      $('#children_wrapper').remove();  //親カテゴリーが初期値になった時、子以下を削除するする
//      $('#grandchildren_wrapper').remove();
//      $('#size_wrapper').remove();
//      $('#brand_wrapper').remove();
//    }
//  });
//  // 子カテゴリー選択後のイベント
//  $('.listing-product-detail__category').on('change', '#child_category', function(){
//    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
//    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
//      $.ajax({
//        url: '/items/get_category_grandchildren',
//        type: 'GET',
//        data: { child_id: childId },
//        dataType: 'json'
//      })
//      .done(function(grandchildren){
//        if (grandchildren.length != 0) {
//          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
//          $('#size_wrapper').remove();
//          $('#brand_wrapper').remove();
//          var insertHTML = '';
//          grandchildren.forEach(function(grandchild){
//            insertHTML += appendOption(grandchild);
//          });
//          appendGrandchidrenBox(insertHTML);
//        }
//      })
//      .fail(function(){
//        alert('カテゴリー取得に失敗しました');
//      })
//    }else{
//      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
//      $('#size_wrapper').remove();
//      $('#brand_wrapper').remove();
//    }
//  });
// });

