class OrderItemsController < ApplicationController
  before_filter :login_required
  before_filter :requires_admin

  def create
    @order = current_order
    @order_item = @order.order_items.where(card_id: order_item_params[:card_id]).first

    if @order_item
      @order_item.quantity += 1
      @order_item.save
    else
      @order_item = @order.order_items.new(order_item_params)
    end

    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private

  def order_item_params
    params.require(:order_item).permit(:card_id, :quantity, :unit_price)
  end
end
