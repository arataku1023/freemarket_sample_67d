class ItemsController < ApplicationController

  def new
   @item = Item.new
   @item.images.build
   @category_parent_array = ["---"]
   Category.where(ancestry: nil).each do |parent|   #データベースから、親カテゴリーのみ抽出し、配列化
     @category_parent_array << parent.name
   end
   respond_to do |format|
    format.html
    format.json
   end
  end


  def create
    @item = Item.new(item_params)
    @item.save!
    # @item.save
    # Image.create
    # Image.create(image_params)
    redirect_to "/"
   end

   def edit
    @item = Item.find(params[:id])
    @item.images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|   #データベースから、親カテゴリーのみ抽出し、配列化
      @category_parent_array << parent.name
    end
    respond_to do |format|
      format.html
      format.json
    end
   end

   def update
    @item = item.find(params[:id])
    @item.update(item_params)
  end

  def get_category_children
   #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
   @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
     #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
     @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item.id)
    # @brand = Brand.find(@item.brand_id)
    @user = User.find(@item.user_id)
    @grandchildren = Category.find(@item.category_id)
    @children = @grandchildren.parent
    @parent = @children.parent  
    @prefecture = Prefecture.find(@item.prefecture_id)
    @arrival_date = Arrival_date.find(@item.arrival_date_id)
  end


  def confirm
    @item=Item.new
  end


  private
  def item_params   #後でmerge内を追加...brand_id etc. #category_id:
    # params.require(:item).permit(:name, :detail, :price, :status, :arrival_date_id, :mail, :mail_way, :prefecture_id, :category_id).merge(user_id: "1", brand_id: "1")
    params.require(:item).permit(:name, :detail, :price, :status, :arrival_date_id, :mail, :mail_way, :prefecture_id, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)

    # params.require(:image).permit(:image, :image_id)
  end


  # def image_params
  #  @item = Item.find(params[:id])
  #  params.require(:image).permit(:image).merge(item_id: @item.id)
  # end

end