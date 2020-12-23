# frozen_string_literal: true

FactoryBot.define do
  factory :dish do
    name { 'ハンバーグ' }
    genre_id              { 2 }
    ready_id              { 2 }
    price               { Faker::Number.between(from: 100, to: 999_999) }
    association         :chef

    after(:build) do |dish|
      dish.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
