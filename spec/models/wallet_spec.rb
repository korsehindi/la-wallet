require 'rails_helper'
require 'faker'

RSpec.describe Wallet, type: :model do
  describe "#validations" do
    it 'should have valid factory' do
      wallet = build :wallet
      expect(wallet).to be_valid
    end

    it 'should validate presence of customer' do
      wallet = build :wallet, customer_id: nil
      expect(wallet).not_to be_valid
      expect(wallet.errors.messages[:customer_id]).to include("can't be blank")
    end

    it 'should validate presence of address' do
      wallet = build :wallet, address: nil
      expect(wallet).not_to be_valid
      expect(wallet.errors.messages[:address]).to include("can't be blank")
    end

    it 'should validate presence of balance' do
      wallet = build :wallet, balance: nil
      expect(wallet).not_to be_valid
      expect(wallet.errors.messages[:balance]).to include("can't be blank")
    end

    it 'should validate uniqueness of address' do
      wallet = create :wallet
      other_wallet = build :wallet, address: wallet.address
      expect(other_wallet).not_to be_valid
      other_wallet.address = Faker::Crypto.unique.sha256
      expect(other_wallet).to be_valid
    end

    # sha256 is exactly 64 characters long, not more, not less.
    it 'should validate length for address' do
      wallet = build :wallet, address: Faker::Crypto.unique.sha1
      expect(wallet).not_to be_valid, "expecting a sha256 hash"
      wallet.address = Faker::Crypto.unique.sha256 + ' '
      expect(wallet).not_to be_valid
    end

    it 'should validate length for alias' do
      wallet = build :wallet, alias: Faker::Crypto.sha256 + ' '
      expect(wallet).not_to be_valid
      expect(wallet.errors.messages[:alias]).to include("is invalid")
    end

    it 'should validate numericality for balance' do
      wallet = build :wallet, balance: Faker::Hacker.adjective
      expect(wallet).not_to be_valid
      expect(wallet.errors.messages[:balance]).to include("is not a number")
    end

    it 'should validate positive numbers for balance' do
      wallet = build :wallet, balance: Faker::Number.negative
      expect(wallet).not_to be_valid
      expect(wallet.errors.messages[:balance]).to include("must be greater than or equal to 0")
    end

    it 'should validate text for alias' do
      wallet = build :wallet, alias: Faker::Number.number(10).to_i
      expect(wallet).not_to be_valid
      expect(wallet.errors.messages[:alias]).to include("is invalid")
    end
  end
end
