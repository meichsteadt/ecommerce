class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @total_items = current_order.total_items
    @order = current_order
    @user = current_user
    @total = current_order.calculate_total.to_f
  end
end
