FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    status { "MyString" }
    price { 1 }
    user { nil }
  end
end
