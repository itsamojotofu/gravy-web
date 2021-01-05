# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def liked_by?(dish_id)
    likes.where(dish_id: dish_id).exists?
  end

  def favorited_by?(chef_id)
    favorite_chefs.where(chef_id: chef_id).exists?
  end

  with_options presence: true do
    validates :nickname
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'needs to be filled in like 000-0000' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :district
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must include alphabet and numbers' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_many :likes
  has_many :favorite_chefs
end
