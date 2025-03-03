class ForecastDaily
	include ActiveModel::Model
	include ActiveModel::Attributes

	attribute :date, :date
	attribute :high, :float
	attribute :low, :float
end