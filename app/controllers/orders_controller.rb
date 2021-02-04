# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_cart
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_user

  def index
    @orders = @user.orders.order(created_at: 'DESC')
    @orders = @orders.page(params[:page]).per(1)

    if @user.card.present?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      card = Card.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end

  def new
    @line_items = current_cart.line_items
    if @cart.line_items.empty?
      redirect_to current_cart, notice: 'カートは空です'
      return
    end
    @order = Order.new

    # クレジットカード情報を表示
    if @user.card.present?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      card = Card.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end

  def create
    @line_items = current_cart.line_items
    unless user_signed_in?
      redirect_to cart_path(@current_cart), notice: 'ログインしてください'
      return
    end
    if @user.card.present?
      @order = Order.new(card_params)
      pay_dish_w_card
      @order.save
      OrderDetail.create_items(@order, @cart.line_items)
      redirect_to root_path
    else
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
  end

  private

  def set_params
    params.permit.merge(user_id: @user.id, dish_id: params[:dish_id], token: params[:token])
  end

  def card_params
    params.permit.merge(user_id: @user.id, dish_id: params[:dish_id], token: @user.card.customer_token)
  end

  def pay_dish
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @cart.total_price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end

  def pay_dish_w_card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @cart.total_price,
      customer: card_params[:token],
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
