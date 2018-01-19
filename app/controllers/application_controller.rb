class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      begin
      Order.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound
        session[:order_id] = nil
        if current_user
          current_user.orders.new
        else
          Order.new
        end
      end
    else
      if current_user
        current_user.orders.new
      else
        Order.new
      end
    end
  end
end
