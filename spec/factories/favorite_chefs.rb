# frozen_string_literal: true

FactoryBot.define do
  factory :favorite_chef do
    user_id { 1 }
    chef_id { 1 }
  end
end
