require 'rails_helper'
require 'faker'

RSpec.describe Deal, type: :model do
  describe "#validations" do
    it 'should have valid factory' do
      deal = build :deal
      expect(deal).to be_valid
    end

    it 'should validate presence of sender wallet' do
      deal = build :deal, sender_wallet: nil
      expect(deal).not_to be_valid
      expect(deal.errors.messages[:sender_wallet]).to include("must exist")
    end

    it 'should validate presence of recipient wallet' do
      deal = build :deal, recipient_wallet: nil
      expect(deal).not_to be_valid
      expect(deal.errors.messages[:recipient_wallet]).to include("must exist")
    end

    it 'should validate presence of amount' do
      deal = build :deal, amount: nil
      expect(deal).not_to be_valid
      expect(deal.errors.messages[:amount]).to include("can't be blank")
    end

    it 'should validate presence of date' do
      deal = build :deal, date: nil
      expect(deal).not_to be_valid
      expect(deal.errors.messages[:date]).to include("can't be blank")
    end

    it 'should validate difference in wallets' do
      deal = build :deal, recipient_wallet_id: 1
      other_deal = build :deal, sender_wallet_id: 1
      expect(deal).not_to be_valid
      other_deal.recipient_wallet_id = 2
      expect(other_deal).to be_valid
    end

    it 'should validate numericality for amount' do
      deal = build :deal, amount: Faker::Hacker.adjective
      expect(deal).not_to be_valid
      expect(deal.errors.messages[:amount]).to include("is not a number")
    end

    it 'should validate positive numbers for amount' do
      deal = build :deal, amount: Faker::Number.negative
      expect(deal).not_to be_valid
      expect(deal.errors.messages[:amount]).to include("must be greater than or equal to 0")
    end

    it 'should validate text for message' do
      deal = build :deal, message: Faker::Number.number(10).to_i
      expect(deal).not_to be_valid
      expect(deal.errors.messages[:message]).to include("is invalid")
    end

    # Should be less than 128 chars, which is sha512 lenght
    it 'should validate length for message' do
      deal = build :deal, message: Faker::Crypto.sha256 * 2 + ' '
      expect(deal).not_to be_valid
      expect(deal.errors.messages[:message]).to include("is invalid")
    end
  end
end
