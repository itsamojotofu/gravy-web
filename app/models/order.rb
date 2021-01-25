# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :dishes, through: :order_details
  has_many :order_details, dependent: :destroy

  attr_accessor :token

  with_options presence: true do
    validates :user_id
    validates :token
  end

  def total_price
    order_details.to_a.sum(&:total_price)
  end

end
