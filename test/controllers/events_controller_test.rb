require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  def setup
    @event = events(:one)
  end

  def teardown
    @event = nil
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @event.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event.id
    assert_response :success
  end

  test "should get create" do
    get :create, event: {'title' => 'Game Day'}
    assert_redirected_to events_path
  end

end
