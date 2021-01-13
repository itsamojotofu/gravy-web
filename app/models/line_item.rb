# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :dish
  belongs_to :cart

  def total_price
    dish.price * quantity
  end
end
