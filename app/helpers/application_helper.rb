module ApplicationHelper
  def time
    @time = Time.new
  end

  def advice
    @response = HTTParty.get("https://api.adviceslip.com/advice")
    @advice = JSON.parse(@response.body)
  end

  def weather
    @response ||= HTTParty.get("https://fcc-weather-api.glitch.me/api/current?lat=16.41639&lon=120.59306")
    @weather = JSON.parse(@response.body)
  end
end
