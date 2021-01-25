# frozen_string_literal: true

class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :dish,                  foreign_key: true
      t.references :order,                 foreign_key: true
      t.integer    :quantity, default: 0,  null: false
      t.timestamps
    end
  end
end
