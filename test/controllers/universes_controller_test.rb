require 'test_helper'

class UniversesControllerTest < ActionController::TestCase

  def setup
    @universe = universes(:one)
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @universe = nil
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @universe.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @universe.id
    assert_response :success
  end

  test "should get create" do
    get :create, universe: {'universe_name' => 'Demo Universe'}
    assert_redirected_to universes_path
  end

=begin
  test "should get update" do
    get :update, id: @universe.id
    assert_redirected_to ubniverses_path
  end
=end 

end
