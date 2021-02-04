# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_cart

  def show
    @user = User.find(params[:id])
    @dishes = @user.dishes
    @chefs = @user.chefs

    Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
    card = Card.find_by(user_id: current_user.id)

    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end

  private

  def set_cart
    @cart = current_cart
  end
end
