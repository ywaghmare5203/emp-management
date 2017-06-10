require 'test_helper'

class TradeCareersControllerTest < ActionController::TestCase
  setup do
    @trade_career = trade_careers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trade_careers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trade_career" do
    assert_difference('TradeCareer.count') do
      post :create, trade_career: { artificer: @trade_career.artificer, class_1: @trade_career.class_1, class_2: @trade_career.class_2, next_paab: @trade_career.next_paab, paab_complete: @trade_career.paab_complete, paab_result: @trade_career.paab_result, tiffy_maths_complete: @trade_career.tiffy_maths_complete, tiffy_maths_req: @trade_career.tiffy_maths_req }
    end

    assert_redirected_to trade_career_path(assigns(:trade_career))
  end

  test "should show trade_career" do
    get :show, id: @trade_career
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trade_career
    assert_response :success
  end

  test "should update trade_career" do
    patch :update, id: @trade_career, trade_career: { artificer: @trade_career.artificer, class_1: @trade_career.class_1, class_2: @trade_career.class_2, next_paab: @trade_career.next_paab, paab_complete: @trade_career.paab_complete, paab_result: @trade_career.paab_result, tiffy_maths_complete: @trade_career.tiffy_maths_complete, tiffy_maths_req: @trade_career.tiffy_maths_req }
    assert_redirected_to trade_career_path(assigns(:trade_career))
  end

  test "should destroy trade_career" do
    assert_difference('TradeCareer.count', -1) do
      delete :destroy, id: @trade_career
    end

    assert_redirected_to trade_careers_path
  end
end
