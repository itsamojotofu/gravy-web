# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :chef
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :ready_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
  validates :price, numericality: { greater_than: 99, less_than: 1_000_000, message: 'should be within ¥100~¥999,999' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ready
  belongs_to_active_hash :genre

end
