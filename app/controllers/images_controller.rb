class ImagesController < ApplicationController
  def destroy
    image = Image.find(params[:id])
    if image.destroy
      redirect_to edit_item_path(image.item_id)
    else
      redirect_to edit_item_path(image.item_id)
    end
  end
end
