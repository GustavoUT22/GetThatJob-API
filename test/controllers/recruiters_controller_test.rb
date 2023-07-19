require "test_helper"

class RecruitersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruiters_index_url
    assert_response :success
  end

  test "should get new" do
    get recruiters_new_url
    assert_response :success
  end

  test "should get show" do
    get recruiters_show_url
    assert_response :success
  end

  test "should get create" do
    get recruiters_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recruiters_destroy_url
    assert_response :success
  end

  test "should get update" do
    get recruiters_update_url
    assert_response :success
  end
end
