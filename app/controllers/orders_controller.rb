class OrdersController < ApplicationController
  before_action :set_cart
  before_action :authenticate_user!, only: [:index]
  before_action :set_dish, only: [:index, :create]
  
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(set_params)
    if @order.valid?
      pay_dish
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_dish
    @dish = Dish.find(params[:dish_id])
    @chef = @dish.chef
    @user = User.find(current_user.id)
  end

  def set_params
    params.permit().merge(user_id: current_user.id, dish_id: params[:dish_id], token: params[:token])
  end

  def pay_dish
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @dish.price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end

  def set_cart
    @cart = current_cart
  end
end
