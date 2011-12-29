require 'test_helper'

class RecordControllerTest < ActionController::TestCase
  test "should get entried" do
    get :entried
    assert_response :success
  end

end
