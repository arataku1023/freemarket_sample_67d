class ItemsController < ApplicationController
  def new
  end

  def confirm
    @item=Item.new
  end  
end
