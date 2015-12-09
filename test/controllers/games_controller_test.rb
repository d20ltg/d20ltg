require 'test_helper'

class GamesControllerTest < ActionController::TestCase

  def setup
    @game = games(:one)
    @tabletop = tabletop_games(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @game = nil
    @tabletop = nil
  end

  test "should get index" do
    get :index, :tabletop_game => @tabletop.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @game.id
    assert_response :success
  end

end
