
require 'mocha/test_unit'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @user = nil
  end

  def current_user
    users @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end
=begin
  test "should get create" do
    get :create, :user => {'username' => 'Demo User'}
    assert_redirected_to users_path
  end
=end
  test "should get destroy" do
    get :destroy, id: @user.id
    assert_response :success
  end

end
