class CardsController < ApplicationController
  require 'payjp'
  before_action :get_payjp_info, only: [:new_create, :create, :delete, :show]
  before_action :set_card
  
  def edit
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "edit", id: current_user.id
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "edit", id: current_user.id
      end
    end
  end

  def delete  #set_cardの変数使用
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "confirmation", id: current_user.id
  end

  def show  #set_cardの変数使用
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    else
      redirect_to action: "confirmation", id: current_user.id
    end
  end

  def confirmation
    card = current_user.cards
    redirect_to action: "show" if card.exists?
  end

  private
  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = "sk_test_45098fce6379a29a1ab3a29b"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end

  def set_card
    @card = current_user.cards.first
  end

end

# Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]