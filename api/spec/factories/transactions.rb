require 'faker'

# Generates random values for transactions and has wallets as foreign keys
FactoryBot.define do
  factory :transaction do
    sequence(:amount) { Faker::Number.decimal(4, 2) }
    sequence(:date) { DateTime.now }
    sequence(:message) { Faker::Hacker.adjective }
    association :sender_wallet, factory: :wallet
    association :recipient_wallet, factory: :wallet
  end
end
