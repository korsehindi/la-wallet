require 'faker'

FactoryBot.define do
  factory :customer do
    sequence(:login) { Faker::Crypto.sha256 }
    sequence(:name) { Faker::Name.name }
    sequence(:url) { Faker::Internet.url }
    sequence(:avatar_url) { Faker::Internet.url }
    sequence(:provider) { Faker::App.name }
    sequence(:slug) { Faker::Internet.slug }
    sequence(:email) { Faker::Internet.unique.email }
    sequence(:location) { Faker::Address.country }
  end
end
