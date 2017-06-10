require 'test_helper'

class SpousesControllerTest < ActionController::TestCase
  setup do
    @spouse = spouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spouse" do
    assert_difference('Spouse.count') do
      post :create, spouse: { anniversary: @spouse.anniversary, date_of_birth: @spouse.date_of_birth, employee_id: @spouse.employee_id, first_name: @spouse.first_name, gender: @spouse.gender, last_name: @spouse.last_name }
    end

    assert_redirected_to spouse_path(assigns(:spouse))
  end

  test "should show spouse" do
    get :show, id: @spouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spouse
    assert_response :success
  end

  test "should update spouse" do
    patch :update, id: @spouse, spouse: { anniversary: @spouse.anniversary, date_of_birth: @spouse.date_of_birth, employee_id: @spouse.employee_id, first_name: @spouse.first_name, gender: @spouse.gender, last_name: @spouse.last_name }
    assert_redirected_to spouse_path(assigns(:spouse))
  end

  test "should destroy spouse" do
    assert_difference('Spouse.count', -1) do
      delete :destroy, id: @spouse
    end

    assert_redirected_to spouses_path
  end
end
