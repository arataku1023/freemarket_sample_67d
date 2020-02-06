class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def new
   @item = Item.new
   @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def show
    @item = Item.find(id: params[:id])
    @images = Image.where(item_id: @item.id)
    @brand = Brand.find(id: @item.brand_id)
    @user = User.find(id: @item.user_id)
    @grandchildren = Category.find(id: @item.category_id)
    @children = @grandchildren.parent
    @parent = @children.parent  
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def confirm
    @item=Item.new
  end  

  private
  def item_params   #後でmerge内を追加...brand_id etc.
    params.require(:item).permit(:detail, :price, :status, :region, :arrival_date, :mail, :mail_way, images_attributes: [:image]).merge(user_id: current_user.id) 
  end

  def set_item
    @item = Item.find(params[:id])
  end
end