class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:purchase, :pay]
  before_action :set_card
  
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
    # binding.pry
    @item = Item.new(item_params)
    @item.save!
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


  def get_category_children        # 親カテゴリーが選択された後に動くアクション
   @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end


  def get_category_grandchildren   # 子カテゴリーが選択された後に動くアクション
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


  def pay #クレジット購入
    if @card.blank?
      redirect_to action: "confrimation"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @item = Item.find(params[:id])
     # 購入した際の情報を元に引っ張ってくる
      card = current_user.cards.first
     # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
      Payjp.api_key = "sk_test_45098fce6379a29a1ab3a29b"
     # キーをセットする(環境変数においても良い)
      Payjp::Charge.create(
      amount: @item.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      if @item.update(sold_status: 1, buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to root_path
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "items", action: 'show'
      end
     #↑この辺はこちら側のテーブル設計どうりに色々しています
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(
      :name, 
      :detail, 
      :price, 
      :status, 
      :arrival_date_id, 
      :mail, 
      :mail_way, 
      :prefecture_id, 
      :category_id, 
      images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end

end