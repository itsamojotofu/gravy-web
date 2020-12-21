# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :about
      t.time :business_hour_begin,      null: false
      t.time :business_hour_end,        null: false
      t.integer :status_id,             null: false
      t.integer :gender_id,             null: false
      t.integer :age_id,                null: false
      t.integer :genre_id,              null: false
      t.references :chef,               foreign_key: true
      t.timestamps
    end
  end
end
