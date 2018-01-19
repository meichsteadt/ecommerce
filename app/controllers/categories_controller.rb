class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  def index

  end

  def show
    if params[:page_number]
      set_page(params[:page_number])
    end
  end
private

  def set_category
    @category = Category.friendly.find(params[:id])
    @products = @category.products.page(1)
  end

  def set_page(page)
    @products = @category.products.page(page)
  end
end
