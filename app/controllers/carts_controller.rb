# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_line_item, only: %i[add_item destroy]
  before_action :set_user
  before_action :set_cart

  def show
    @line_items = @cart.line_items
    first_line_item = @line_items[0]
    @chosen_chef = first_line_item.dish.chef if first_line_item

    @chef_ids = []

    @line_items.each do |line_item|
      @chef_ids << line_item.dish.chef.id
    end

    @chef_ids.each do |chef_id|
      next unless chef_id != @chosen_chef.id

      len = @line_items.length
      @line_items = @line_items.slice(0, len - 1)
      @cart.line_items = @line_items
      @chef_ids = []
      flash[:alert] = '複数のシェフの料理を選択する事はできません。他のシェフの料理を選ぶ場合は、一度カゴを空にしてください。'
    end
  end

  def add_item
    @line_item = @cart.line_items.build(dish_id: params[:dish_id]) if @line_item.blank?
    @line_item.quantity += params[:quantity].to_i
    if @line_item.save
      redirect_to current_cart
    else
      redirect_to dish_path(params[:dish_id])
    end
  end

  def destroy
    @cart.destroy
    redirect_to current_cart
  end

  private

  def set_user
    @user = current_user
  end

  def set_line_item
    @line_item = current_cart.line_items.find_by(dish_id: params[:dish_id])
  end

  def set_cart
    @cart = current_cart
  end
end
