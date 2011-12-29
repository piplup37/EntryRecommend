require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  test "should get entry" do
    get :entry
    assert_response :success
  end

  test "should get entried" do
    get :entried
    assert_response :success
  end

end
