# frozen_string_literal: true

class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string     :name, null: false
      t.text       :about
      t.integer    :genre_id,                 null: false
      t.integer    :ready_id,                 null: false
      t.integer    :price,                    null: false
      t.references :chef, foreign_key: true
      t.timestamps
    end
  end
end
