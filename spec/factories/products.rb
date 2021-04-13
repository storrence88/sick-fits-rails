# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    status { 'DRAFT' }
    price { 1 }
    user { nil }
  end
end
