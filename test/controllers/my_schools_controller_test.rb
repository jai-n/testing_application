require 'test_helper'

class MySchoolsControllerTest < ActionController::TestCase
  setup do
    @my_school = my_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_school" do
    assert_difference('MySchool.count') do
      post :create, my_school: { active: @my_school.active, address: @my_school.address, city: @my_school.city, company_name: @my_school.company_name, contact_name: @my_school.contact_name, email: @my_school.email, name: @my_school.name, note: @my_school.note, phone_number: @my_school.phone_number, post_code: @my_school.post_code, vat_number: @my_school.vat_number, website_url: @my_school.website_url }
    end

    assert_redirected_to my_school_path(assigns(:my_school))
  end

  test "should show my_school" do
    get :show, id: @my_school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_school
    assert_response :success
  end

  test "should update my_school" do
    patch :update, id: @my_school, my_school: { active: @my_school.active, address: @my_school.address, city: @my_school.city, company_name: @my_school.company_name, contact_name: @my_school.contact_name, email: @my_school.email, name: @my_school.name, note: @my_school.note, phone_number: @my_school.phone_number, post_code: @my_school.post_code, vat_number: @my_school.vat_number, website_url: @my_school.website_url }
    assert_redirected_to my_school_path(assigns(:my_school))
  end

  test "should destroy my_school" do
    assert_difference('MySchool.count', -1) do
      delete :destroy, id: @my_school
    end

    assert_redirected_to my_schools_path
  end
end
