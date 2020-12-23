class Dish < ApplicationRecord
  belongs_to :chef, optional: true
  has_one_attached :image

end
