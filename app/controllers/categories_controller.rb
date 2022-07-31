class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category, only: ['show', 'edit', 'update', 'destroy']
  
  def index
    @categories = Category.all
  end

  def show
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    respond_to do |format|
      if @category.save
        format.html {redirect_to categories_path, notice: "Successfully create" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @category.update(category_params)
        format.html {redirect_to @category, notice: "Successfully update" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
    
    @category.destroy

    redirect_to categories_path, status: 303
  end

  private 
    def get_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end