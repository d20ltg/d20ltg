class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def clear
    current_order.order_items.clear
    redirect_to carts_show_path
  end

  def complete
    current_order.order_items.each do |item|
      item.card.stock -= item.quantity
      item.card.save
    end
    current_order.completed = true
    current_order.save

    order_id = session[:order_id]
    session[:order_id] = nil

    redirect_to action: 'summary', order: order_id
  end

  def summary
    @order = Order.find(params[:order])
  end
end
