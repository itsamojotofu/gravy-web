class CreateFavoriteChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_chefs do |t|
      t.integer :user_id
      t.integer :chef_id

      t.timestamps
    end
  end
end
