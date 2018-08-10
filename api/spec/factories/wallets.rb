require 'faker'

# Generates random values for wallets and has customer as foreign key
FactoryBot.define do
  factory :wallet do
    sequence(:address) { Faker::Crypto.unique.sha256 }
    sequence(:balance) { Faker::Number.decimal(4) }
    sequence(:alias) { Faker::Hacker.noun }
    customer
  end
end
