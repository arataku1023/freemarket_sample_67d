class ItemsController < ApplicationController

  require 'payjp'
  before_action :set_card
  before_action :set_item, only: [:edit, :update, :show, :pay, :confirm, :destroy]


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
    redirect_to root_path
  end


  def edit
    @item.images.build
    @images = Image.where(item_id: @item.id)
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @grandchild.parent.parent.name
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|   #データベースから、親カテゴリーのみ抽出し、配列化
      @category_parent_array << parent.name
    end
    @category_children_array = [@child.name]           #式展開を解除
    Category.where(ancestry: "1").pluck(:name)
    @category_grandchildren_array = [@grandchild.name] #式展開を解除
    Category.where(ancestry: "1/14").pluck(:name)
    respond_to do |format|
      format.html
      format.json
    end
  end


   def update
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(@item.id)
    end   
  end


  def get_category_children        # 親カテゴリーが選択された後に動くアクション
   @category_children = Category.find_by(name: params[:parent_name], ancestry: nil).children #式展開を解除
  end


  def get_category_grandchildren   # 子カテゴリーが選択された後に動くアクション
     @category_grandchildren = Category.find(params[:child_id]).children #式展開を解除
  end
  

  def show
    @images = Image.where(item_id: @item.id)
    @user = User.find(@item.user_id)
    @grandchildren = Category.find(@item.category_id)
    @children = @grandchildren.parent
    @parent = @children.parent  
    @prefecture = Prefecture.find(@item.prefecture_id)
    @arrival_date = Arrival_date.find(@item.arrival_date_id)
    
    # @brand = Brand.find(@item.brand_id) ←後日実装の予定
  end


  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to delete_item_path
    end  
  end


  def confirm
    @user = User.find(current_user.id)
  end


  def delete
  end


  def pay #クレジット購入
    if @card.blank?
      redirect_to action: "confrimation"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
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