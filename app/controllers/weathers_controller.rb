class WeathersController < ApplicationController
  def get_forecast
    address = params[:address]
    if address.present?
      @forecast_data = WeathersHelper.get_forecast(address)
    end
  end
end