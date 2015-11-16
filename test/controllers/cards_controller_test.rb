require 'test_helper'

class CardsControllerTest < ActionController::TestCase

  def setup
    @card = cards(:one)
    @expansion = expansions(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @card = nil
    @expansion = nil
  end

  test "should get index" do
    get :index, :expansion => @expansion.id
    assert_response :success
  end

  test "should get show" do
    get :show, id: @card.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card.id
    assert_response :success
  end

  test "should get create" do
    get :create, card: {'name' => 'Demo Card'}
    assert_redirected_to cards_path
  end

end
