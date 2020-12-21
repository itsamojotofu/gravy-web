class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '営業中' },
    { id: 3, name: '調理で忙しいです' },
    { id: 4, name: 'お休みしています' }
  ]

  include ActiveHash::Associations
  has_many :profiles
end