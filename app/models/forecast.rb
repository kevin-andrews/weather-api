class Forecast
	include ActiveModel::Model
	include ActiveModel::Attributes

	attribute :current_temp, :float
	attribute :forecast_daily, default: []
	attribute :from_cache, default: false
end