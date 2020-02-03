class HomeController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(2)
  end
end
