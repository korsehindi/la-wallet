require 'faker'

FactoryBot.define do
  factory :customer do
    email Faker::Internet.unique.email
    password_digest Faker::Internet.password
    title Faker::Name.prefix
    country Faker::Address.country_code
    name Faker::Name.name
    gender Faker::Gender.type
    age Faker::Number.number(2)
    slug Faker::Internet.slug
  end
end
