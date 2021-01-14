# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_cart
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_user

  def index
    @order = Order.new
  end

  def new
    @line_items = current_cart.line_items
    if @cart.line_items.empty?
      redirect_to current_cart, notice: "カートは空です"
      return
    end
    @order = Order.new
  end

  def create
    @line_items = current_cart.line_items
    unless user_signed_in?
      redirect_to cart_path(@current_cart), notice: "ログインしてください"
      return
    end
    @order = Order.new(set_params)
    if @order.valid?
      pay_dish
      @order.save
      OrderDetail.create_items(@order, @cart.line_items)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_params
    params.permit.merge(user_id: current_user.id, dish_id: params[:dish_id], token: params[:token])
  end

  def pay_dish
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @cart.total_price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end

  def set_user
    @user = current_user
  end

  def set_cart
    @cart = current_cart
  end
end

