require 'test_helper'

class AddressesHelperTest < ActiveSupport::TestCase
  test "extract_zip_code extracts a 5-digit zip code from the end of the address" do
    address = "123 Main St, Sacramento CA, 95816"
    assert_equal "95816", AddressesHelper.extract_zip_code(address)
  end

  test "extract_zip_code returns an empty string if no zip code is found" do
    address = "123 Main St, Sacramento CA"
    assert_equal "", AddressesHelper.extract_zip_code(address)
  end
end