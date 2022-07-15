# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get comments_new_url
    assert_response :success
  end

  test 'should get edit' do
    get comments_edit_url
    assert_response :success
  end

  test 'should get index' do
    get comments_index_url
    assert_response :success
  end

  test 'should get save' do
    get comments_save_url
    assert_response :success
  end

  test 'should get update' do
    get comments_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get comments_destroy_url
    assert_response :success
  end
end
