# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { "#{Faker::Internet.password(min_length: 4)}l1" }
    password_confirmation { password }
    zip_code              { '111-1111' }
    prefecture_id         { 2 }
    district              { '薄野' }
    street                { '蛍ストリート　125-3' }
    phone_number          { '0802178284' }
  end
end
