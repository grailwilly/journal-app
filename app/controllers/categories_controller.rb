class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_time
  before_action :advice_api
  before_action :weather_api
  
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

    def advice_api
      @response = HTTParty.get("https://api.adviceslip.com/advice")
      @advice = JSON.parse(@response.body)
    end

    def weather_api
      @response = HTTParty.get("https://fcc-weather-api.glitch.me/api/current?lat=16.41639&lon=120.59306")
      @w_json = JSON.parse(@response.body)
    end

    def category_params
      params.require(:category).permit(:name)
    end
end