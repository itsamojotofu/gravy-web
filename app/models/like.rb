# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :dish, optional: true
  belongs_to :chef, optional: true
end
