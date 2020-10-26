require 'faker'

FactoryBot.define do
  factory :user do
    firstname {Faker::Internet.username(specifier: 2..15)}
    lastname {Faker::Internet.username(specifier: 2..15)}
    username {Faker::Internet.username(specifier: 2..25)}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
  end
end
