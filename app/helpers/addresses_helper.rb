module AddressesHelper
	def self.extract_zip_code(address)
    # We are assuming the zip code always exists and is always 5 digits at the end of the string
    address.match(/\d{5}$/).to_s
  end
end