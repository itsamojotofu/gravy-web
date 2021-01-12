# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_cart
  before_action :dish_params

  def create
    Like.create(user_id: current_user.id, dish_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, dish_id: params[:id]).destroy
  end

  private

  def dish_params
    @dish = Dish.find(params[:id])
  end

  def set_cart
    @cart = current_cart
  end
end
