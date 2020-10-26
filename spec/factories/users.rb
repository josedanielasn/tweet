require 'faker'

FactoryBot.define do
  factory :user do
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    username {Faker::Internet.username(specifier: 2..15)}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
  end
end
