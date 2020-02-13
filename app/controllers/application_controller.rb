class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :tomy_category
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_card

  
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def tomy_category
   @parents = Category.order("id ASC").limit(13)
  end

  def set_card
    if user_signed_in?
      @card = current_user.cards.first
    end
  end

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day])
  end
end
