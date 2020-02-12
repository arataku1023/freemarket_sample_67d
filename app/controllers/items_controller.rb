class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

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
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end  
  end

   def edit
    # @item = Item.find(params[:id])
    @item.images.build
    @images = Image.where(item_id: @item.id)
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @grandchild.parent.parent.name
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|   #データベースから、親カテゴリーのみ抽出し、配列化
      @category_parent_array << parent.name
    end
    @category_children_array = ["#{@child.name}"]
    Category.where(ancestry: "1").each do |children|   #データベースから、親カテゴリーのみ抽出し、配列化
      @category_children_array << children.name
    end
    @category_grandchildren_array = ["#{@grandchild.name}"]
    Category.where(ancestry: "1/14").each do |grandchildren|   #データベースから、親カテゴリーのみ抽出し、配列化
      @category_grandchildren_array << grandchildren.name
    end
    respond_to do |format|
      format.html
      format.json
    end
   end

   def update
    # @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render redirect_to edit_item_path(@item.id)
    end   
  end

  # def get_category_children
  #   #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
  #   @category_children = Category.find_by(name: "#{params[:parent_name]}").children
  # end

  # # 子カテゴリーが選択された後に動くアクション
  # def get_category_grandchildren
  #   #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
  #   @category_grandchildren = Category.find("#{params[:child_id]}").children
  # end
  
  def show
    # @item = Item.find(params[:id])
    @images = Image.where(item_id: @item.id)
    # @brand = Brand.find(@item.brand_id)
    @user = User.find(@item.user_id)
    @grandchildren = Category.find(@item.category_id)
    @children = @grandchildren.parent
    @parent = @children.parent  
    @prefecture = Prefecture.find(@item.prefecture_id)
    @arrival_date = Arrival_date.find(@item.arrival_date_id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  def confirm
    @item=Item.new
  end

  def delete
  end


  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end

  
  private
  def item_params   #後でmerge内を追加...brand_id etc. #category_id:
    # params.require(:item).permit(:name, :detail, :price, :status, :arrival_date_id, :mail, :mail_way, :prefecture_id, :category_id).merge(user_id: "1", brand_id: "1")
    params.require(:item).permit(:name, :detail, :price, :status, :arrival_date_id, :mail, :mail_way, :prefecture_id, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)

    # params.require(:image).permit(:image, :image_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end  

  # def grand_child_category_brother_search(id)
  #   # @itemのcategory_id（孫）から見たparent_id（子id）を取得
  #   grand_child_category_parent_id = Category.find(id).parent_id
  #   # @itemのcategory_id（孫）から見たparent_id（子id）と同じparent_id（子id）をもつレコードを取得
  #   grand_child_category_brother_ids = Category.where(parent_id: grand_child_category_parent_id)
  #   return grand_child_category_brother_ids
  # end
  
  # def child_category_brother_search(id)
  #   # @itemのcategory_id（孫）から見たparent（子id）のもつparent_id（親）を取得
  #   child_category_parent_id = Category.find(id).parent.parent_id
  #   # @itemのcategory_id（孫）から見たparent（子）のもつparent_id（親）と同じparent_id（親）をもつレコードを取得
  #   child_category_brother_ids = Category.where(parent_id: child_category_parent_id)
  # end
end