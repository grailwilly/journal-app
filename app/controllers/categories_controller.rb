class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @time = Time.new
  end
  
end