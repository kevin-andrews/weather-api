module WeathersHelper
  def self.get_forecast(address)
    zip_code = AddressesHelper.extract_zip_code(address)
    return zip_code
  end
end