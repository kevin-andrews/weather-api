class ForecastWeekly
	include ActiveModel::Model
	include ActiveModel::Attributes

	attribute :current_temp, :float
	attribute :forecast_daily, default: []

	#def forecast_daily=(values)
	#@forecast_daily = values.map do |attrs|
#			ForecastDaily.new(attrs)
#		end#
	#end

	#def forecast_daily
	#	@forecast_daily ||= []
	#end
end