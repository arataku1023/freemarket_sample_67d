class ItemsController < ApplicationController
  def new
   @item = Item.new
   @category_parent_array = ["---"]
   #データベースから、親カテゴリーのみ抽出し、配列化
   Category.where(ancestry: nil).each do |parent|
     @category_parent_array << parent.name
   end
   respond_to do |format|
    format.html
    format.json
   end
  end
  
  def get_category_children
   #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
   @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
     #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
     @category_grandchildren = Category.find("#{params[:child_id]}").children

  def create
   Item.create(item_params)
   Image.create(image_params)
   redirect_to "#"
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

  def confirm
    @item=Item.new
  end

  private
  def item_params   #後でmerge内を追加...brand_id etc. #category_id:
    params.require(:item).permit(:detail, :price, :status, :region, :arrival_date, :mail, :mail_way).merge(user_id: current_user.id)  
  end

  def image_params
   params.require(:image).permit(:image).merge(item_id: current_item.id)
  end

end
