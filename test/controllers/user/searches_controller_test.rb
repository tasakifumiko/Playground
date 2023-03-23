require "test_helper"

class User::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_searches_show_url
    assert_response :success
  end
end
