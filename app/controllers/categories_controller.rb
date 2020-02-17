class CategoriesController < ApplicationController

  def index
  end


  def show
    @category = Category.find(params[:id])
    category_check(@category)
    @images = Image.all

  end


  private 

  def category_check(cat)
    anc = cat.ancestry
    match_id = []

    if anc.blank?
      anc_set = "#{cat.id}"       # "^#{cat.id}/"
      reg = Regexp.new(anc_set)
      not_null_categories = Category.where.not("ancestry IS NULL")
      not_null_categories.each do |c|
        if c[:ancestry].match(reg)
          match_id << c.id
        end
      end
      @items = Item.where(category_id: match_id, buyer_id: nil).order("id DESC")

    elsif anc.match(/\//)
      @items = Item.where(category_id: cat.id, buyer_id: nil).order("id DESC")

    else
      parent = anc
      child = cat.id
      anc_set = "#{parent}/#{child}"
      Category.all.each do |c|
        if c[:ancestry] == anc_set
          match_id << c.id
        end
      end
      @items = Item.where(category_id: match_id, buyer_id: nil).order("id DESC")
    end

  end

end