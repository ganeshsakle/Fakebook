require "test_helper"

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get static_page_new_url
    assert_response :success
  end
end
