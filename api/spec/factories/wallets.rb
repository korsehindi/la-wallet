require 'faker'

FactoryBot.define do
  factory :wallet do
    sequence(:address) { Faker::Crypto.unique.sha256 }
    sequence(:balance) { Faker::Number.decimal(4) }
    sequence(:alias) { Faker::Hacker.noun }
    sequence(:customer) { Faker::Number.number(2) }
  end
end
