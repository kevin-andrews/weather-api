CACHE_EXPIRY = 30.minutes
DUMMY_FORECAST_DATA = {
  "10000" => Forecast.new(current_temp: 75,
    forecast_daily: [
      ForecastDaily.new(date: Date.today, high: 80, low: 70),
      ForecastDaily.new(date: Date.today+1, high: 81, low: 71),
      ForecastDaily.new(date: Date.today+2, high: 82, low: 72),
      ForecastDaily.new(date: Date.today+3, high: 83, low: 73),
      ForecastDaily.new(date: Date.today+4, high: 84, low: 74),
      ForecastDaily.new(date: Date.today+5, high: 85, low: 75),
      ForecastDaily.new(date: Date.today+6, high: 86, low: 76),
    ]
  ),
  "10001" => Forecast.new(current_temp: -20,
    forecast_daily: [
      ForecastDaily.new(date: Date.today, high: -10.5, low: -20.5),
      ForecastDaily.new(date: Date.today+1, high: 5, low: 0),
      ForecastDaily.new(date: Date.today+2, high: 6, low: 1),
      ForecastDaily.new(date: Date.today+3, high: 7, low: 2),
      ForecastDaily.new(date: Date.today+4, high: 8, low: 3),
      ForecastDaily.new(date: Date.today+5, high: 9, low: 4),
      ForecastDaily.new(date: Date.today+6, high: 10, low: 5),
    ]
  ),
   "10002" => Forecast.new(current_temp: 50,
    forecast_daily: [
      ForecastDaily.new(date: Date.today, high: 60, low: 40),
    ]
  )
}

module WeathersHelper
  def self.get_forecast(address)
    zip_code = AddressesHelper.extract_zip_code(address)
    return get_forecast_by_zipcode(zip_code)
  end

  def self.get_forecast_by_zipcode(zip_code)
    cached_data = Rails.cache.read(zip_code)
    if (cached_data)
      cached_data.from_cache = true
      return cached_data
    end

    if DUMMY_FORECAST_DATA.key?(zip_code)
      data = DUMMY_FORECAST_DATA[zip_code]
      Rails.cache.write(zip_code, data, expires_in: CACHE_EXPIRY)
      return data
    end
  end
end