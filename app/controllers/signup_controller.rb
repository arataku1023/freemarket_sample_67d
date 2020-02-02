class SignupController < ApplicationController
  # def index
  # end

  def index
    @user = User.new
  end

  # def sms_authentication
  # def done
  #   # step1で入力された値をsessionに保存
  #   session[:nickname] = user_params[:nickname]
  #   session[:email] = user_params[:email]
  #   session[:password] = user_params[:password]
  #   session[:last_name] = user_params[:last_name]
  #   session[:first_name] = user_params[:first_name]
  #   session[:last_name_kana] = user_params[:last_name_kana]
  #   session[:first_name_kana] = user_params[:first_name_kana]
  #   session[:birth_year] = user_params[:birth_year]
  #   session[:birth_month] = user_params[:birth_month]
  #   session[:birth_day] = user_params[:birth_day]
  #   @user = User.new( # 新規インスタンス作成
  #   # sessionに保存された値をインスタンスに渡す
  #     nickname: session[:nickname],
  #     email: session[:email],
  #     password: session[:password],
  #     last_name: session[:last_name],
  #     first_name: session[:first_name],
  #     last_name_kana: session[:last_name_kana],
  #     first_name_kana: session[:first_name_kana],
  #     birth_year: session[:birth_year],
  #     birth_month: session[:birth_month],
  #     birth_day: session[:birth_day],
  #     # 入力前の情報は、バリデーションに通る値を仮で入れる
  #     # phone_num: "08000000000"
  #   )
  #   render '/signup/step1' unless @user.valid?
  # end

  # def sms_confirmation
  #   session[:phone_num] = user_params[:phone_num]
  #   @user = User.new( # 新規インスタンス作成
  #     nickname: session[:nickname],
  #     email: session[:email],
  #     password: session[:password],
  #     password_confirmation: session[:password_confirmation],
  #     last_name: session[:last_name],
  #     first_name: session[:first_name],
  #     last_name_kana: session[:last_name_kana],
  #     first_name_kana: session[:first_name_kana],
  #     birth_year: session[:birth_year],
  #     birth_month: session[:birth_month],
  #     birth_day: session[:birth_day],
  #     phone_num: session[:phone_num]
  #   )
  #   render '/signup/sms_authentication' unless @user.valid?
  # end

  # def address
  #   session[:authentication_num] = user_params[:authentication_num]
  #   @user = User.new( # 新規インスタンス作成
  #   nickname: session[:nickname],
  #   email: session[:email],
  #   password: session[:password],
  #   password_confirmation: session[:password_confirmation],
  #   last_name: session[:last_name],
  #   first_name: session[:first_name],
  #   last_name_kana: session[:last_name_kana],
  #   first_name_kana: session[:first_name_kana],
  #   birth_year: session[:birth_year],
  #   birth_month: session[:birth_month],
  #   birth_day: session[:birth_day],
  #   phone_num: session[:phone_num],
  #   )
  #   render '/signup/sms_confirmation' unless @user.valid?
  # end

  # def create
  #   session[:last_name] = user_params[:last_name]
  #   session[:first_name] = user_params[:first_name]
  #   session[:last_name_kana] = user_params[:last_name_kana]
  #   session[:first_name_kana] = user_params[:first_name_kana]
  #   @user = User.new( # 新規インスタンス作成
  #   nickname: session[:nickname],
  #   email: session[:email],
  #   password: session[:password],
  #   password_confirmation: session[:password_confirmation],
  #   last_name: session[:last_name],
  #   first_name: session[:first_name],
  #   last_name_kana: session[:last_name_kana],
  #   first_name_kana: session[:first_name_kana],
  #   birth_year: session[:birth_year],
  #   birth_month: session[:birth_month],
  #   birth_day: session[:birth_day],
  #   phone_num: session[:phone_num]
  #   )
  #   if @user.save
  #     session[:id] = @user.id
  #     redirect_to action: 'done'
  #   else
  #     render '/signup/address'
  #   end
  # end

  # def done
  #   sign_in User.find(session[:id]) unless user_signed_in?
  # end

# private
#   def user_paramse
#     params.require(:user).permit(
#       :nickname,
#       :email,
#       :password,
#       :password_confirmation,
#       :last_name,
#       :first_name,
#       :last_name_kana,
#       :first_name_kana,
#       :birth_year,
#       :birth_month,
#       :birth_day,
#       :phone_num
#     )
#   end


# class SignupController < ApplicationController
#   def index
#   end

#   def step1
#     @user = User.new 
    
#   end

#   def sms_authentication
#     session[:nickname] = user_params[:nickname]
#     session[:email] = user_params[:email]
#     session[:encrypted_password] = user_params[:encrypted_password]
#     session[:last_name] = user_params[:last_name]
#     session[:first_name] = user_params[:first_name]
#     session[:last_name_kana] = user_params[:last_name_kana]
#     session[:first_name_kana] = user_params[:first_name_kana]
#     session[:birth_year] = user_params[:birth_year]
#     session[:birth_month] = user_params[:birth_month]
#     session[:birth_day] = user_params[:birth_day]
#     @user = User.new(
#       nickname: session[:nickname],
#       email: session[:email],
#       encrypted_password: session[:encrypted_passwordpassword],
#       last_name: session[:last_name],
#       first_name: session[:first_name],
#       last_name_kana: session[:last_name_kana],
#       first_name_kana: session[:first_name_kana],
#       birth_year: session[:birth_year],
#       birth_month: session[:birth_month],
#       birth_day: session[:birth_day],
#       phone_num: "08000000000",
     
#     )
#     render '/signup/step1' unless @user.valid?
#   end

#   def sms_confirmation
#     session[:phone_num] = user_params[:phone_num]
#     @user = User.new
#       nickname: session[:nickname], 
#       email: session[:email],
#       encrypted_password: session[:encrypted_password],
#       last_name: session[:last_name], 
#       first_name: session[:first_name], 
#       last_name_kana: session[:last_name_kana], 
#       first_name_kana: session[:first_name_kana], 
#       birth_year: session[:birth_year],
#       birth_month: session[:birth_month],
#       birth_day: session[:birth_day],
#       phone_num: session[:phone_num]
#     render '/signup/sms_confirmation' unless @user.valid?
#   end
 
#   def create
#     session[:last_name] = user_params[:last_name]
#     session[:first_name] = user_params[:first_name]
#     session[:last_name_kana] = user_params[:last_name_kana]
#     session[:first_name_kana] = user_params[:first_name_kana]
#     @user = User.new(
#       nickname: session[:nickname], 
#       email: session[:email],
#       encrypted_password: session[:encrypted_password],
#       last_name: session[:last_name], 
#       first_name: session[:first_name], 
#       last_name_kana: session[:last_name_kana], 
#       first_name_kana: session[:first_name_kana], 
#       birth_year: session[:birth_year],
#       birth_month: session[:birth_month],
#       birth_day: session[:birth_day],
#       phone_num: session[:phone_num]
#     )
#     if @user.save
#       session[:id] = @user.id
#       redirect_to done_signup_index_path
#     end
#   end

    

#     def done
#       sign_in User.find(session[:id]) unless user_signed_in?
#     end

    # def sms_post
    #   @profile = Profile.new
    #   #パラメータが飛んでなかった場合ここでrender
    #   render sms_authentication_signup_index_path unless  profile_params[:tel].present?
    #   #電話番号を+81~の国際書式に書き換え（そうしないと送れない）
    #   phone_number = profile_params[:tel].sub(/\A./,'+81')
    #   #ランダムに5桁の整数を生成
    #   sms_number = rand(10000..99999)
    #   #後の認証用にsessionに預ける
    #   session[:sms_number] = sms_number
    #   #環境変数を使ってsms送信準備 
    #   client = Twilio::REST::Client.new(ENV["TWILLIO_SID"],ENV["TWILLIO_TOKEN"])
    #   #送信失敗した場合必ずエラーが出るので、例外処理で挙動を分岐
    #   begin 
    #     #生成した整数を文章にしたsms送信
    #     client.api.account.messages.create(from: ENV["TWILLIO_NUMBER"], to: phone_number, body: sms_number)
    #   rescue
    #     #失敗した場合ここが動く
    #     render "signup/sms_authentication"
    #     return false
    #   end
    #   #成功した場合、以下のコードが動き、smsの照合画面へと変遷する
    #   redirect_to sms_confirmation_signup_index_path
    # end
#     def sms_check
#       @profile = Profile.new
#       #送信された値を代入
#       sms_number = profile_params[:tel]
#       #比較し、一致したら次の登録フォームへ
#       if sms_number.to_i == session[:sms_number]
#         redirect_to address_signup_index_path
#       else
#         render "signup/sms_confirmation"
#       end
#     end

#     private

#     def profile_params
#       #パラメータの項目が多いので割愛、今回は:telに乗せます。
#       params.require(:profile).permit(:tel,:address)
#     end

#     def profile_params
#       #パラメータの項目が多いので割愛、今回は:telに乗せます。
#       params.require(:profile).permit(:tel,:address)
#     end

#     def user_params
#       params.require(:user).permit(
#         :nickname, 
#         :email, 
#         :encrypted_password, 
#         :last_name, 
#         :first_name, 
#         :last_name_kana, 
#         :first_name_kana,
#         :phone_num
#       )
#     end
end
