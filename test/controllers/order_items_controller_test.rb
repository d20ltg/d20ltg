require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase

  def setup
    @order_item = order_items(:one)
  end

  def teardown
    @order_item = nil
  end

  test "should get create" do
    get :create, :order_item => { 'unit_price' => 1.95 }
    assert_response :success
  end

end
