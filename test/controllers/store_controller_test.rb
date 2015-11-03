require 'test_helper'

class StoreControllerTest < ActionController::TestCase

  def setup
    @store = stores(:one)
  end

  def teardown
    @store = nil
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store.id
    assert_response :success
  end

  test "should get create" do
    get :create, store: {'store_address' => 'Demo Address'}
    assert_redirected_to stores_path
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get show" do
    get :show, id: @store.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
