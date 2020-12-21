class Profile < ApplicationRecord
  belongs_to :chef, optional: true

  with_options presence: true do
    validates :business_hour_begin
    validates :business_hour_end
    validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :gender_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :age_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :gender
  belongs_to_active_hash :age
  belongs_to_active_hash :genre
end
