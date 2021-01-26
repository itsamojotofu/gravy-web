# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_cart
  before_action :set_user
  before_action :authenticate_user!

  def new
    redirect_to root_path if @user.card.present?
  end

  def create
    if params[:card_token] != 'null'
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      customer = Payjp::Customer.create(
        description: 'test', # テストカードであることを説明
        card: params[:card_token] # 登録しようとしているカード情報
      )

      card = Card.new(
        card_token: params[:card_token],
        customer_token: customer.id,
        user_id: current_user.id
      )

      card.save
      redirect_to root_path
    else
      flash[:alert] = 'no such token: null'
      redirect_to new_card_path
    end
  end

  def show
    if @user.card.present?
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      card = Card.find_by(user_id: @user.id) # ユーザーのid情報を元に、カード情報を取得

      customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
      @card = customer.cards.first
    end
  end

  def destroy
    if @user.card.present?
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      card = Card.find_by(user_id: @user.id) # ユーザーのid情報を元に、カード情報を取得

      customer = Payjp::Customer.retrieve(card.customer_token)
      customer.delete
      card.delete
    end

    redirect_to user_path(@user.id)
  end

  private

  def set_cart
    @cart = current_cart
  end

  def set_user
    @user = current_user
  end
end
