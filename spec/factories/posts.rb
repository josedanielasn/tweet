FactoryBot.define do
  factory :post do
    user { create(:user) }
    message { Faker::String.random(length: 1..300).tr("\u0000", "") }
  end
end
