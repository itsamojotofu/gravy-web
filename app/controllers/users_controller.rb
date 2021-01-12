class UsersController < ApplicationController
  before_action :set_cart

  def show
    @user = User.find(params[:id])
    @dishes = @user.dishes
    @chefs = @user.chefs
  end
  
  private

  def set_cart
    @cart = current_cart
  end
end
