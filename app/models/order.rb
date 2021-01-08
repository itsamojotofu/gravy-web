class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dish

  attr_accessor :token

  with_options presence: true do
    validates :user_id
    validates :token
  end

end
