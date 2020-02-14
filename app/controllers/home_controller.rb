class HomeController < ApplicationController

  def index
    @items = Item.where(buyer_id: nil).order(created_at: :desc)
    @images = Image.all
  end
end