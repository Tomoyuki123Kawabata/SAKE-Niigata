require "test_helper"

class Public::PostSakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_sakes_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_sakes_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_post_sakes_show_url
    assert_response :success
  end
end
