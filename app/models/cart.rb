# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :dishes, through: :line_items

  # Cartモデルに商品（LineItem）を登録するメソッド（カート登録機能）
  def add_dish(dish_id)
      line_items.find_or_initialize_by(dish_id: dish_id)
  end

  def add_quantiy(quantity)
    line_items.find_or_initialize_by(quantity: quantity)
  end


  def total_price
    line_items.to_a.sum(&:total_price)
  end

  def total_number
    line_items.to_a.sum(&:quantity)
  end
end
