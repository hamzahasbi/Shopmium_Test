require 'test_helper'

class PositionsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get positions_controller_index_url
    assert_response :success
  end

  test "should get new" do
    get positions_controller_new_url
    assert_response :success
  end

  test "should get delete" do
    get positions_controller_delete_url
    assert_response :success
  end

  test "should get edit" do
    get positions_controller_edit_url
    assert_response :success
  end

end
