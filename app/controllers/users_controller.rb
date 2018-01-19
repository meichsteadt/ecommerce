class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :destroy]
  def show
    @user = current_user
  end

  def destroy
    sign_out
    session[:order_id] = nil
    redirect_to '/'
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      sign_in @user
      redirect_to '/charges/new'
    else
      redirect_to "users#new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    respond_to do |format|
      format.js
      format.html
    end
    else
      flash[:notice] = "There was a problem updating"
      redirect_to :back
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :zip, :email, :marketing_opt_in, :password)
  end
end
