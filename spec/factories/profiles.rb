# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    business_hour_begin    { Time.now }
    business_hour_end      { Time.now }
    status_id              { 2 }
    gender_id              { 2 }
    age_id                 { 2 }
    genre_id               { 2 }
  end
end
