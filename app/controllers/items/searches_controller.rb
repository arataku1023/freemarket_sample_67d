class Items::SearchesController < ApplicationController
  def index
    @items = Item.search(params[:keyword]).where(buyer_id: nil)
  end
end
