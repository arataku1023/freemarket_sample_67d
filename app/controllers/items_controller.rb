class ItemsController < ApplicationController
  def new
  end
  
  def show
  end

  def confirm
    @item=Item.new
  end  

end
