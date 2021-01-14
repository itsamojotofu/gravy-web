class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :dish

  def self.create_items(order, line_items)
    line_items.target.each do |item|
      OrderDetail.create!(
        order_id: order.id, dish_id: item[:dish_id], quantity: item[:quantity]
      )
      LineItem.find(item[:id]).delete
    end
  end

  def total_price
    dish.price * quantity
  end
  
end
