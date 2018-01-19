class ProductsController <  ApplicationController
  def index
    @products = Product.all.page(1)
    if params[:page_number]
      set_page(params[:page_number])
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    @order_item = OrderItem.new()
  end

private
  def set_page(page)
    @products = Product.all.page(page)
  end
end
