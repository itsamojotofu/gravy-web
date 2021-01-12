class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def new
    @line_item = LineItem.new
  end

  #セッションからCart情報を取得し、Cart情報に紐ずく商品を登録する、CartとDishを取得しLineItemを追加してトップ画面へ遷移させる、
  def create
    #カート情報(セッション情報)を取得
    @cart = current_cart
    #注文情報を取得
    dish = Dish.find(params[:line_item][:dish_id])
    #すでにカートにあるものかどうかを判断させる
    @line_item = @cart.add_dish(dish.id)

    respond_to do |format|
      if @line_item.save
        #cars/:idに遷移する
        format.html { redirect_to @line_item.cart, notice: 'カートに商品が追加されました。' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:dish_id, :cart_id)
    end
end
