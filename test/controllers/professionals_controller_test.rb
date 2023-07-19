require "test_helper"

class ProfessionalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professionals_index_url
    assert_response :success
  end

  test "should get new" do
    get professionals_new_url
    assert_response :success
  end

  test "should get show" do
    get professionals_show_url
    assert_response :success
  end

  test "should get create" do
    get professionals_create_url
    assert_response :success
  end

  test "should get destroy" do
    get professionals_destroy_url
    assert_response :success
  end

  test "should get update" do
    get professionals_update_url
    assert_response :success
  end
end
