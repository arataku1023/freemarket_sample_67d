Rails.application.routes.draw do


end


  
    # collection do
    #   get 'step1'
      # get 'sms_authentication'
      # post 'sms_authentication' => 'signup#sms_post'
      # get 'sms_confirmation'
      # post 'sms_confirmation' => 'signup#sms_check'
      # get 'address'
      # get 'done'
    # end



# resources :signup do
#   collection do
#     get 'step1'
#     get 'sms_authentication' 
#     #入力された番号へのSMS送信、送信した文字列の保持
#     post 'sms_authentication' => 'signup#sms_post'
#     #受信した値の入力フォーム
#     get 'sms_confirmation' 
#     #値の照合
#     post 'sms_confirmation' => 'signup#sms_check'
#     #一致したら下のパスに飛んで登録画面が続く
#     get 'address' 
#     get 'done'
#   end
# end


