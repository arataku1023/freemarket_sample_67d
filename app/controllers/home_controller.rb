class HomeController < ApplicationController

  def index
    # @items = Item.all.order(created_at: :desc)
    @items = Item.where(buyer_id: "").order(created_at: :desc)
    @images = Image.all
  end
end