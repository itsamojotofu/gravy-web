# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_121_141_356) do
  create_table 'active_storage_attachments', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'cards', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'card_token', null: false
    t.string 'customer_token', null: false
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_cards_on_user_id'
  end

  create_table 'carts', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'chefs', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'zip_code', null: false
    t.integer 'prefecture_id', null: false
    t.string 'district', null: false
    t.string 'street', null: false
    t.string 'phone_number', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_chefs_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_chefs_on_reset_password_token', unique: true
  end

  create_table 'dishes', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'about'
    t.integer 'genre_id', null: false
    t.integer 'ready_id', null: false
    t.integer 'price', null: false
    t.bigint 'chef_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['chef_id'], name: 'index_dishes_on_chef_id'
  end

  create_table 'favorite_chefs', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'chef_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'favorite_dishes', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'dish_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'favorites', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'chef_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'likes', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'dish_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'line_items', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'dish_id'
    t.bigint 'cart_id'
    t.integer 'quantity', default: 0, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cart_id'], name: 'index_line_items_on_cart_id'
    t.index ['dish_id'], name: 'index_line_items_on_dish_id'
  end

  create_table 'order_details', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'dish_id'
    t.bigint 'order_id'
    t.integer 'quantity', default: 0, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['dish_id'], name: 'index_order_details_on_dish_id'
    t.index ['order_id'], name: 'index_order_details_on_order_id'
  end

  create_table 'orders', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'dish_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['dish_id'], name: 'index_orders_on_dish_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'profiles', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.text 'about'
    t.time 'business_hour_begin', null: false
    t.time 'business_hour_end', null: false
    t.integer 'status_id', null: false
    t.integer 'gender_id', null: false
    t.integer 'age_id', null: false
    t.integer 'genre_id', null: false
    t.bigint 'chef_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['chef_id'], name: 'index_profiles_on_chef_id'
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'nickname', null: false
    t.string 'zip_code', null: false
    t.integer 'prefecture_id', null: false
    t.string 'district', null: false
    t.string 'street', null: false
    t.string 'phone_number', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'cards', 'users'
  add_foreign_key 'dishes', 'chefs'
  add_foreign_key 'line_items', 'carts'
  add_foreign_key 'line_items', 'dishes'
  add_foreign_key 'order_details', 'dishes'
  add_foreign_key 'order_details', 'orders'
  add_foreign_key 'orders', 'dishes'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'profiles', 'chefs'
end
