class CartsController < ApplicationController
  before_action :set_line_item, only: [:add_item, :destroy]
  before_action :set_user
  before_action :set_cart

  def show
    @line_items = @cart.line_items
  end

  def add_item
    @line_item = @cart.line_items.build(dish_id: params[:dish_id]) if @line_item.blank?
    @line_item.quantity += params[:quantity].to_i
    binding.pry
    if @line_item.save
      redirect_to current_cart
    else
      flash[:notice] = "料理の追加に失敗しました"
      redirect_to  dish_path(params[:dish_id])
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
