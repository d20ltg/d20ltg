require 'test_helper'

class ExpansionsControllerTest < ActionController::TestCase

  def setup
    @expansion = expansions(:one)
  end

  def teardown
    @expansion = nil
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expansion.id
    assert_response :success
  end

  test "should get create" do
    get :create, expansion: {'set_name' => 'Demo Expansion'}
    assert_redirected_to expansions_path
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get show" do
    get :show, id: @expansion.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
