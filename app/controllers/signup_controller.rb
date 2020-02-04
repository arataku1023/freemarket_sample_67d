class SignupController < ApplicationController
  # require 'payjp'
  # Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  def registration
    @user = User.new
  end

  def address
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:encrypted_password] = user_params[:encrypted_password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      encrypted_password: session[:encrypted_password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],

      name: user_params[:name],
      post_code: user_parms[:post_code],
      prefecture: user_params[:prefecture],
      town: user_params[:town],
      address_num: user_params[:address_num]
                  
    )
    if @user.save
      session[:user_id] = @user.id # ログイン状態維持のためuser_idをsessionに保存
      redirect_to new_user_path
    else
      render '/signup/registration'
    end
  end
  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :encrypted_password,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :post_code,
      :prefecture,
      :town,
      :address_num,
      address_attributes: [:id, :post_code, :prefecture, :town, :address_num]
     )
  end

  end


#   def sms_confirmation
#     # step1で入力された値をsessionに保存
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
#     @user = User.new( # 新規インスタンス作成
#     # sessionに保存された値をインスタンスに渡す
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
#       # 入力前の情報は、バリデーションに通る値を仮で入れる
#       phone_num: "08000000000",
#       post_code: "000-0000",
#       # { id: 1, name: '北海道' } で北海道を呼び出している
#       prefecture: "1",
#       town: "福岡市南区",
#       address_num: "",
#     )
#     render '/signup/registration' unless @user.valid?
#   end

#   def sms_confirmation_sms
#     session[:phone_num] = user_params[:phone_num]
#     @user = User.new( # 新規インスタンス作成
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
#       phone_num: session[:phone_num],
#       post_code: "000-0000",
#       prefecture: "1",
#       town: "福岡市南区",
#       address_num: "1番地",
#       apartment_info: "",
#     )
#     render '/signup/sms_confirmation' unless @user.valid?
#   end

#   def address
#     @user = User.new( # 新規インスタンス作成
#     nickname: session[:nickname],
#     email: session[:email],
#     encrypted_password: session[:encrypted_password],
#     last_name: session[:last_name],
#     first_name: session[:first_name],
#     last_name_kana: session[:last_name_kana],
#     first_name_kana: session[:first_name_kana],
#     birth_year: session[:birth_year],
#     birth_month: session[:birth_month],
#     birth_day: session[:birth_day],
#     phone_num: session[:phone_num],
#     post_code: "000-0000",
#     prefecture: "1",
#     town: "福岡市",
#     address_num: "南区",
#     )
#     render '/signup/sms_confirmation_sms' unless @user.valid?
#   end

#   def create
#     session[:last_name] = user_params[:last_name]
#     session[:first_name] = user_params[:first_name]
#     session[:last_name_kana] = user_params[:last_name_kana]
#     session[:first_name_kana] = user_params[:first_name_kana]
#     session[:post_code] = user_params[:post_code]
#     session[:prefecture] = user_params[:prefecture]
#     session[:town] = user_params[:town]
#     session[:address_num] = user_params[:address_num]
#     sessiser_par @user = User.new( # 新規インスタンス作成

#     nickname: session[:nickname],
#     email: session[:email],
#     encrypted_password: session[:encrypted_password],
#     last_name: session[:last_name],
#     first_name: session[:first_name],
#     last_name_kana: session[:last_name_kana],
#     first_name_kana: session[:first_name_kana],
#     birth_year: session[:birth_year],
#     birth_month: session[:birth_month],
#     birth_day: session[:birth_day],
#     phone_num: session[:phone_num],
#     post_code: user_params[:post_code],
#     prefecture: user_params[:prefecture],
#     town: user_params[:town],
#     address_num: user_params[:address_num],)
#     if @user.save
#       session[:id] = @user.id
#       redirect_to credit_card_signup_index_path
#     else
#       render '/signup/address'
#     end
#   end

#   def credit_card
#   end

#   def pay #payjpとCardのデータベース作成を実施します。
#     if params['payjp-token'].blank?
#       redirect_to action: 'new'
#     else
#       customer = Payjp::Customer.create(
#       card: params['payjp-token']
#       )
#       @card = Card.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
#       if @card.save
#         redirect_to action: 'done'
#       else
#         redirect_to action: 'pay'
#       end
#     end
#   end

#   def done
#     sign_in User.find(session[:id]) unless user_signed_in?
#   end

# private
#   def user_params
#     params.require(:user).permit(
#       :nickname,
#       :email,
#       :encrypted_password,
#       :last_name,
#       :first_name,
#       :last_name_kana,
#       :first_name_kana,
#       :birth_year,
#       :birth_month,
#       :birth_day,
#       :phone_num,
#       :post_code,
#       :prefecture,
#       :town,
#       :address_num,
#     )
#   end
# end
