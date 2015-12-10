require 'test_helper'

class ExpansionsControllerTest < ActionController::TestCase

  def setup
    @expansion = expansions(:one)
    @block = blocks(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @expansion = nil
    @block = nil
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expansion.id
    assert_response :success
  end

  # test "should get create" do
  #   get :create, expansion: {set_name: 'Demo Expansion', block_id: 1}
  #   assert_redirected_to expansions_path
  # end

  #test "should get update" do
   # get :update
   # assert_response :success
  #end

  test "should get show" do
    get :show, id: @expansion.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
