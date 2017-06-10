require 'test_helper'

class NextOfKinsControllerTest < ActionController::TestCase
  setup do
    @next_of_kin = next_of_kins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:next_of_kins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create next_of_kin" do
    assert_difference('NextOfKin.count') do
      post :create, next_of_kin: { address: @next_of_kin.address, contact_number: @next_of_kin.contact_number, first_name: @next_of_kin.first_name, last_name: @next_of_kin.last_name, relation: @next_of_kin.relation }
    end

    assert_redirected_to next_of_kin_path(assigns(:next_of_kin))
  end

  test "should show next_of_kin" do
    get :show, id: @next_of_kin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @next_of_kin
    assert_response :success
  end

  test "should update next_of_kin" do
    patch :update, id: @next_of_kin, next_of_kin: { address: @next_of_kin.address, contact_number: @next_of_kin.contact_number, first_name: @next_of_kin.first_name, last_name: @next_of_kin.last_name, relation: @next_of_kin.relation }
    assert_redirected_to next_of_kin_path(assigns(:next_of_kin))
  end

  test "should destroy next_of_kin" do
    assert_difference('NextOfKin.count', -1) do
      delete :destroy, id: @next_of_kin
    end

    assert_redirected_to next_of_kins_path
  end
end
