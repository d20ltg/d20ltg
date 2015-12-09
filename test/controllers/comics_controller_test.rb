require 'test_helper'

class ComicsControllerTest < ActionController::TestCase

  def setup
    @comic = comics(:one)
    @universe = universes(:one)
    @comic.universe_id = @universe.id
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
  end

  def teardown
    @comic = nil
    @universe = nil
  end

  test "should get index" do
    get :index, :universe => @universe.id
    assert_response :success
  end

=begin
  test "should get show" do
    get :show, :universe => @universe.id, id: @comic.id
    assert_response :success
  end
=end
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comic.id
    assert_response :success
  end

=begin
  test "should get create" do
    get :create, comic: {'comic_name' => 'Demo Comic'}
    assert_redirected_to "/comics?universe_id=#{@comic.universe_id}"
  end

  test "should get update" do
    get :update, :universe => @universe.id, comic: {'comic_name' => 'Demo Comic'}
    assert_redirected_to "/comics?universe_id=#{@comic.universe_id}"
  end
=end
end
