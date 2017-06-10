require 'test_helper'

class QualificationsControllerTest < ActionController::TestCase
  setup do
    @qualification = qualifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qualifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qualification" do
    assert_difference('Qualification.count') do
      post :create, qualification: { end_date: @qualification.end_date, grade: @qualification.grade, school: @qualification.school, status: @qualification.status, title: @qualification.title, type: @qualification.type }
    end

    assert_redirected_to qualification_path(assigns(:qualification))
  end

  test "should show qualification" do
    get :show, id: @qualification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qualification
    assert_response :success
  end

  test "should update qualification" do
    patch :update, id: @qualification, qualification: { end_date: @qualification.end_date, grade: @qualification.grade, school: @qualification.school, status: @qualification.status, title: @qualification.title, type: @qualification.type }
    assert_redirected_to qualification_path(assigns(:qualification))
  end

  test "should destroy qualification" do
    assert_difference('Qualification.count', -1) do
      delete :destroy, id: @qualification
    end

    assert_redirected_to qualifications_path
  end
end
