require 'test_helper'

class QuoteControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get quote_new_url
    assert_response :success
  end

end
