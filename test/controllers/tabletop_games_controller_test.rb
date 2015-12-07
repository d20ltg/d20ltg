require 'test_helper'

class TabletopGamesControllerTest < ActionController::TestCase

  def setup
    @tabletop = tabletop_games(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @tabletop = nil
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tabletop.id
    assert_response :success
  end

  test "should get create" do
    get :create, tabletop_game: {'set_name' => 'Demo Brand'}
    assert_redirected_to tabletop_games_path
  end

=begin
  test "should get update" do
    get :update
    assert_response :success
  end
=end

  test "should get show" do
    get :show, id: @tabletop.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
