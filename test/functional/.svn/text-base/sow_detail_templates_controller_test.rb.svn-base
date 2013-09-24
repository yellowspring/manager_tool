require 'test_helper'

class SowDetailTemplatesControllerTest < ActionController::TestCase
  setup do
    @sow_detail_template = sow_detail_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sow_detail_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sow_detail_template" do
    assert_difference('SowDetailTemplate.count') do
      post :create, sow_detail_template: @sow_detail_template.attributes
    end

    assert_redirected_to sow_detail_template_path(assigns(:sow_detail_template))
  end

  test "should show sow_detail_template" do
    get :show, id: @sow_detail_template.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sow_detail_template.to_param
    assert_response :success
  end

  test "should update sow_detail_template" do
    put :update, id: @sow_detail_template.to_param, sow_detail_template: @sow_detail_template.attributes
    assert_redirected_to sow_detail_template_path(assigns(:sow_detail_template))
  end

  test "should destroy sow_detail_template" do
    assert_difference('SowDetailTemplate.count', -1) do
      delete :destroy, id: @sow_detail_template.to_param
    end

    assert_redirected_to sow_detail_templates_path
  end
end
