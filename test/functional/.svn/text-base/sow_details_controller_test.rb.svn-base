require 'test_helper'

class SowDetailsControllerTest < ActionController::TestCase
  setup do
    @sow_detail = sow_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sow_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sow_detail" do
    assert_difference('SowDetail.count') do
      post :create, sow_detail: @sow_detail.attributes
    end

    assert_redirected_to sow_detail_path(assigns(:sow_detail))
  end

  test "should show sow_detail" do
    get :show, id: @sow_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sow_detail.to_param
    assert_response :success
  end

  test "should update sow_detail" do
    put :update, id: @sow_detail.to_param, sow_detail: @sow_detail.attributes
    assert_redirected_to sow_detail_path(assigns(:sow_detail))
  end

  test "should destroy sow_detail" do
    assert_difference('SowDetail.count', -1) do
      delete :destroy, id: @sow_detail.to_param
    end

    assert_redirected_to sow_details_path
  end
end
