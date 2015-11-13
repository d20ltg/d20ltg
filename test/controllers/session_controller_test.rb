require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @user = nil
  end

  test "should get create" do
    get :create
    assert_redirected_to login_path
  end

  test "should get destroy" do
    get :destroy
    assert_redirected_to root_url
  end

end
