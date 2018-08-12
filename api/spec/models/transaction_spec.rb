require 'rails_helper'
require 'faker'

RSpec.describe Transaction, type: :model do
  describe "#validations" do
    it 'should have valid factory' do
      transaction = build :transaction
      expect(transaction).to be_valid
    end

    it 'should validate presence of sender wallet' do
      transaction = build :transaction, sender_wallet: nil
      expect(transaction).not_to be_valid
      expect(transaction.errors.messages[:sender_wallet]).to include("must exist")
    end

    it 'should validate presence of recipient wallet' do
      transaction = build :transaction, recipient_wallet: nil
      expect(transaction).not_to be_valid
      expect(transaction.errors.messages[:recipient_wallet]).to include("must exist")
    end

    it 'should validate presence of amount' do
      transaction = build :transaction, amount: nil
      expect(transaction).not_to be_valid
      expect(transaction.errors.messages[:amount]).to include("can't be blank")
    end

    it 'should validate presence of date' do
      transaction = build :transaction, date: nil
      expect(transaction).not_to be_valid
      expect(transaction.errors.messages[:date]).to include("can't be blank")
    end

    it 'should validate difference in wallets' do
      transaction = build :transaction, recipient_wallet_id: 1
      other_transaction = build :transaction, sender_wallet_id: 1
      expect(transaction).not_to be_valid
      other_transaction.recipient_wallet_id = 2
      expect(other_transaction).to be_valid
    end

    it 'should validate numericality for amount' do
      transaction = build :transaction, amount: Faker::Hacker.adjective
      expect(transaction).not_to be_valid
      expect(transaction.errors.messages[:amount]).to include("is not a number")
    end

    it 'should validate positive numbers for amount' do
      transaction = build :transaction, amount: Faker::Number.negative
      expect(transaction).not_to be_valid
      expect(transaction.errors.messages[:amount]).to include("must be greater than or equal to 0")
    end

    it 'should validate text for message' do
      transaction = build :transaction, message: Faker::Number.number(10).to_i
      expect(transaction).not_to be_valid
      expect(transaction.errors.messages[:message]).to include("is invalid")
    end

    # Should be less than 128 chars, which is sha512 lenght
    it 'should validate length for message' do
      transaction = build :transaction, message: Faker::Crypto.sha256 * 2 + ' '
      expect(transaction).not_to be_valid
      expect(transaction.errors.messages[:message]).to include("is invalid")
    end
  end
end
