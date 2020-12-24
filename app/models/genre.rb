# frozen_string_literal: true

class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '和食' },
    { id: 3, name: '中華' },
    { id: 4, name: '洋食' },
    { id: 5, name: 'アジアン' },
    { id: 6, name: 'フレンチ' },
    { id: 7, name: 'イタリアン' },
    { id: 8, name: 'スイーツ' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :profiles
  has_many :chefs
end
