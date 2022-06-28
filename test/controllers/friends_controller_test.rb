require "test_helper"

class FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get friends_new_url
    assert_response :success
  end

  test "should get edit" do
    get friends_edit_url
    assert_response :success
  end

  test "should get index" do
    get friends_index_url
    assert_response :success
  end

  test "should get save" do
    get friends_save_url
    assert_response :success
  end

  test "should get update" do
    get friends_update_url
    assert_response :success
  end

  test "should get destroy" do
    get friends_destroy_url
    assert_response :success
  end
end
