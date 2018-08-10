require 'rails_helper'
require 'faker'

RSpec.describe Customer, type: :model do
  describe "#validations" do
    it 'should have valid factory' do
      customer = build :customer
      expect(customer).to be_valid
    end

    it 'should validate presence of login' do
      customer = build :customer, login: nil
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:login]).to include("can't be blank")
    end

    it 'should validate presence of name' do
      customer = build :customer, name: nil
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:name]).to include("can't be blank")
    end

    it 'should validate presence of url' do
      customer = build :customer, url: nil
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:url]).to include("can't be blank")
    end

    it 'should validate presence of avatar_url' do
      customer = build :customer, avatar_url: nil
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:avatar_url]).to include("can't be blank")
    end

    it 'should validate presence of provider' do
      customer = build :customer, provider: nil
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:provider]).to include("can't be blank")
    end

    it 'should validate presence of slug' do
      customer = build :customer, slug: nil
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:slug]).to include("can't be blank")
    end

    it 'should validate uniqueness of login' do
      customer = create :customer
      other_customer = build :customer, login: customer.login
      expect(other_customer).not_to be_valid
      other_customer.login = Faker::Crypto.unique.sha256
      expect(other_customer).to be_valid
    end

    it 'should validate uniqueness of url' do
      customer = create :customer
      other_customer = build :customer, url: customer.url
      expect(other_customer).not_to be_valid
      other_customer.url = Faker::Internet.unique.url
      expect(other_customer).to be_valid
    end

    it 'should validate uniqueness of slug' do
      customer = create :customer
      other_customer = build :customer, slug: customer.slug
      expect(other_customer).not_to be_valid
      other_customer.slug = Faker::Internet.unique.slug
      expect(other_customer).to be_valid
    end

    it 'should validate uniqueness of email' do
      customer = create :customer
      other_customer = build :customer, email: customer.email
      expect(other_customer).not_to be_valid
      other_customer.email = Faker::Internet.unique.email
      expect(other_customer).to be_valid
    end

    it 'should validate email length' do
      customer = build :customer, email: 'a@a'
      expect(customer).not_to be_valid, "expecting a valid email address"
    end
  end

  describe '.recent' do
    it 'should list recent user first' do
      old_customer = create :customer
      newer_customer = create :customer
      expect(described_class.recent).to eq(
                                          [ newer_customer, old_customer ])
      old_customer.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
                                          [ old_customer, newer_customer ])
      
    end
  end
end
