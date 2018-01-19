class SearchesController < ApplicationController
  def index
    @search = params[:search]
    @products = Product.search(@search)
  end

  def create
    @search = params[:search]
    redirect_to searches_path(search: @search)
  end

private
  def search_params
    params.permit(:search)
  end
end
