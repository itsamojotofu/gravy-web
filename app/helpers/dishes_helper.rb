# frozen_string_literal: true

module DishesHelper
  def stock_array_maker(stock)
    dish = Dish.find(params[:id])
    stock = dish.stock_quantity
    array = []
    n = 0
    loop do
      n += 1
      array.push(n)
      break if n == stock
    end
    array
  end
end
