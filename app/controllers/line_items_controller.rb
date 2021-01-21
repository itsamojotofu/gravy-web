# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[update destroy]

  def index
    @line_items = LineItem.all
  end

  def new
    @line_item = LineItem.new
  end

  def create
    # カート情報(セッション情報)を取得
    @cart = current_cart
    # 注文情報を取得
    dish = Dish.find(params[:line_item][:dish_id])
    # すでにカートにあるものかどうかを判断
    @line_item = @cart.add_dish(dish.id)

    respond_to do |format|
      if @line_item.save
        # carts/:idに遷移する
        format.html { redirect_to @line_item.cart, notice: 'カゴに料理が追加されました' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @line_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def destroy
    @line_item.destroy
    redirect_to current_cart
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:dish_id, :cart_id)
  end
end
