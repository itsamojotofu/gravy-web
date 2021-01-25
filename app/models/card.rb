class Card < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :card_token
  end
  
end
