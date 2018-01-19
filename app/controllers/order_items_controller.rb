class OrderItemsController < ApplicationController
  def new

  end

  def create
    @order = current_order
    @item = OrderItem.new(item_params)
    if @order.includes_item?(@item)
      @order.order_items.find_by_product_id(@item.product_id).update(quantity: @item.quantity)
      redirect_to cart_path
    else
      @order.order_items << @item
      @order.save
      session[:order_id] = @order.id
      redirect_to cart_path
    end
  end

  def update
    @item = OrderItem.find(params[:id])
    @item.update(item_params)
    redirect_to cart_path
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id, :order_id)
  end
end
