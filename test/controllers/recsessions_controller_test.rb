require "test_helper"

class RecsessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recsessions_index_url
    assert_response :success
  end

  test "should get new" do
    get recsessions_new_url
    assert_response :success
  end

  test "should get show" do
    get recsessions_show_url
    assert_response :success
  end

  test "should get create" do
    get recsessions_create_url
    assert_response :success
  end

  test "should get edit" do
    get recsessions_edit_url
    assert_response :success
  end

  test "should get update" do
    get recsessions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recsessions_destroy_url
    assert_response :success
  end
end
