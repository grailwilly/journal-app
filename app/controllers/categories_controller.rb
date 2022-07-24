class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_time
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html {redirect_to categories_path, notice: "Successfully create" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update(category_params)
        format.html {redirect_to @category, notice: "Successfully update" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, status: 303
  end

  private 
    def get_time
      @time = Time.new
    end

    def category_params
      params.require(:category).permit(:name)
    end
end