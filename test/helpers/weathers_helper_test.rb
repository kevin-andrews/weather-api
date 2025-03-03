require 'test_helper'

class WeathersHelperTest < ActiveSupport::TestCase
  test "get_forecast_by_zipcode fetches data by zip_code" do
    zip_code = "10000"
    Rails.cache.clear
    result = WeathersHelper.get_forecast_by_zipcode(zip_code)

    assert_equal DUMMY_FORECAST_DATA[zip_code], result
    assert_equal false, result.from_cache

    result = WeathersHelper.get_forecast_by_zipcode(zip_code)

    assert_equal true, result.from_cache
  end

  test "get_forecast_by_zipcode returns nil for unknown zip codes" do
    zip_code = "99999"
    assert_nil WeathersHelper.get_forecast_by_zipcode(zip_code)
  end
end