class ChargesController < ApplicationController
  def show
    response = RestClient.post('https://connect.stripe.com/oauth/token', {client_secret: ENV['SECRET_KEY'], code: params[:code], grant_type: 'authorization_code'}.to_json, {content_type: :json, accept: :json})
    redirect_to "/contact"
  end

  def new
    @order = current_order
    current_user ? @user = current_user : @user = User.new()
    @total = current_order.calculate_total.to_f
  end

  def create
    # Amount in cents
    @amount = charges_params[:total].to_f
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

  begin
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd',
      :destination => {
        :amount => ((@amount - 30) * 95).to_i,
        :account => "acct_1BjcyTBm6ZGmvfMj"
      }
    )
  rescue Stripe::CardError => eInvalidRequestError
    flash[:error] = e.message
    redirect_to new_charge_path
  end
    session[:order_id] = nil
  end
private
  def charges_params
    params.permit(:total)
  end
end
