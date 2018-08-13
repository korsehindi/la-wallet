require 'faker'

# Generates random values for deals and has wallets as foreign keys
FactoryBot.define do
  factory :deal do
    sequence(:amount) { Faker::Number.decimal(4, 2) }
    sequence(:date) { DateTime.now }
    sequence(:message) { Faker::Hacker.noun }
    association :sender_wallet, factory: :wallet
    association :recipient_wallet, factory: :wallet
  end
end
