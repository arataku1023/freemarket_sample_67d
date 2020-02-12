class ImagesController < ApplicationController
  def destroy
    image = Image.find(params[:id])
    image.destroy
    item = Item.find(image.item_id)
    redirect_to "/items/#{item.id}/edit"
  end
end
