class Ready < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '5' },
    { id: 3, name: '10' },
    { id: 4, name: '15' },
    { id: 5, name: '20' },
    { id: 6, name: '25' },
    { id: 7, name: '30' },
    { id: 8, name: '40' },
    { id: 9, name: '45' },
    { id: 10, name: '50' },
    { id: 11, name: '55' },
    { id: 12, name: '60' }
  ]

  include ActiveHash::Associations
  has_many :dishes
end