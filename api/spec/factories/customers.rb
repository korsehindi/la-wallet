require 'faker'

FactoryBot.define do
  factory :customer do
    sequence(:email) { Faker::Internet.unique.email }
    sequence(:slug) { Faker::Internet.unique.slug }
    sequence(:password_digest) { Faker::Internet.unique.password }
    sequence(:title) { Faker::Name.prefix }
    sequence(:country) { Faker::Address.country_code }
    sequence(:name) { Faker::Name.name }
    sequence(:gender) { Faker::Gender.type }
    sequence(:age) { Faker::Number.number(2) }
  end
end
