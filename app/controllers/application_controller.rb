class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_time
  before_action :advice_api
  before_action :weather_api

  def after_sign_in_path_for(resource)
    categories_path
  end
    
  protected

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

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
