# frozen_string_literal: true

class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '男性' },
    { id: 3, name: '女性' }
  ]

  include ActiveHash::Associations
  has_many :profiles
end
