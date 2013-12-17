require 'test_helper'

class TheoryDaysControllerTest < ActionController::TestCase
  setup do
    @theory_day = theory_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theory_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theory_day" do
    assert_difference('TheoryDay.count') do
      post :create, theory_day: { end_time: @theory_day.end_time, repeat_weekly: @theory_day.repeat_weekly, school_class_id: @theory_day.school_class_id, start_date: @theory_day.start_date, start_time: @theory_day.start_time }
    end

    assert_redirected_to theory_day_path(assigns(:theory_day))
  end

  test "should show theory_day" do
    get :show, id: @theory_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theory_day
    assert_response :success
  end

  test "should update theory_day" do
    patch :update, id: @theory_day, theory_day: { end_time: @theory_day.end_time, repeat_weekly: @theory_day.repeat_weekly, school_class_id: @theory_day.school_class_id, start_date: @theory_day.start_date, start_time: @theory_day.start_time }
    assert_redirected_to theory_day_path(assigns(:theory_day))
  end

  test "should destroy theory_day" do
    assert_difference('TheoryDay.count', -1) do
      delete :destroy, id: @theory_day
    end

    assert_redirected_to theory_days_path
  end
end
