require 'test_helper'

class BlocksControllerTest < ActionController::TestCase

def setup
    @block = blocks(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @block = nil
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @block.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @block.id
    assert_response :success
  end

  test "should get create" do
    get :create, block: {'block_name' => 'Demo Block'}
    assert_redirected_to expansions_path
  end

end
