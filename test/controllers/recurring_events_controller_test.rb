require 'test_helper'

class RecurringEventsControllerTest < ActionController::TestCase

  def setup
    @event = RecurringEvent.create({ title: 'Test Event', day: 3 })
  end

  def teardown
    @event = nil
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @event.id
  #   assert_response :success
  # end

  # test "should get create" do
  #   get :create, recurring_event: {'title' => 'Weekly draft', 'day' => 2}
  #   assert_redirected_to recurring_events_path
  # end

  # test "should get update" do
  #   get :update, id: @event.id, recurring_event: {'day' => 5}
  #   assert_redirected_to recurring_events_path
  # end

  # test "should get destroy" do
  #   get :destroy, id: @event.id
  #   assert_redirected_to recurring_events_path
  # end

  test "should get show" do
    get :show, id: @event.id
    assert_response :success
  end

end
