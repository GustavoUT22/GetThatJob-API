require "test_helper"

class JobControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_index_url
    assert_response :success
  end

  test "should get new" do
    get job_new_url
    assert_response :success
  end

  test "should get show" do
    get job_show_url
    assert_response :success
  end

  test "should get create" do
    get job_create_url
    assert_response :success
  end

  test "should get destroy" do
    get job_destroy_url
    assert_response :success
  end

  test "should get update" do
    get job_update_url
    assert_response :success
  end
end
