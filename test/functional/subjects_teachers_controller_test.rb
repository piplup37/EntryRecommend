require 'test_helper'

class SubjectsTeachersControllerTest < ActionController::TestCase
  setup do
    @subjects_teacher = subjects_teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects_teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subjects_teacher" do
    assert_difference('SubjectsTeacher.count') do
      post :create, subjects_teacher: @subjects_teacher.attributes
    end

    assert_redirected_to subjects_teacher_path(assigns(:subjects_teacher))
  end

  test "should show subjects_teacher" do
    get :show, id: @subjects_teacher.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subjects_teacher.to_param
    assert_response :success
  end

  test "should update subjects_teacher" do
    put :update, id: @subjects_teacher.to_param, subjects_teacher: @subjects_teacher.attributes
    assert_redirected_to subjects_teacher_path(assigns(:subjects_teacher))
  end

  test "should destroy subjects_teacher" do
    assert_difference('SubjectsTeacher.count', -1) do
      delete :destroy, id: @subjects_teacher.to_param
    end

    assert_redirected_to subjects_teachers_path
  end
end
