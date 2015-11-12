
require 'mocha/test_unit'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    #login(username: @user.username, password: @user.hashed_password)
    #User.authenticate(@user.username, @user.hashed_password)
    #controller.stub(:current_user) {@user}
    #@mock_controller = mock("ApplicationController")
    #@mock_controller.stub(:current_user) {@user}
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

  test "should get create" do
    get :create, :user => {'username' => 'Demo User'}
    assert_redirected_to users_path
  end

  test "should get destroy" do
    get :destroy, id: @user.id
    assert_response :success
  end

end
