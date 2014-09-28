require 'test_helper'

class EmployerControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

end
