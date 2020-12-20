class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      
      t.text :about,
      t.
      t.integer :status_id,
      t.integer :gender_id,
      t.integer :age_id,
      t.integer :genre_id,
      t.references :chef, 
      t.timestamps
    end
  end
end

| about          | text        | null: false                    |
| business_hour  | string      | null: false                    |
| status_id      | integer     | null: false                    |
| gender_id      | integer     | null: false                    |
| age_id         | integer     | null: false                    |
| genre_id       | integer     | null: false                    |
t.string :name,               null: false
      t.string :zip_code,           null: false
      t.integer :prefecture_id,     null: false
      t.string :district,           null: false
      t.string :street,             null: false