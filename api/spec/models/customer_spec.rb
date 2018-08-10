require 'rails_helper'
require 'faker'

RSpec.describe Customer, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build :customer).to be_valid
    end

    it 'should validate the presence of the email' do
      customer = build :customer, email: ''
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:email]).to include("can't be blank")
    end

    it 'should validate email length' do
      customer = build :customer, email: 'a@a'
      expect(customer).not_to be_valid, "expecting a valid email address"
    end

    it 'should validate uniqueness of the email' do
      customer = create :customer
      invalid_customer = build :customer, email: customer.email
      expect(invalid_customer).not_to be_valid
    end

    it 'should validate the presence of the password_digest' do
      customer = build :customer, password_digest: ''
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:password_digest]).to include("can't be blank")
    end

    it 'should validate the presence of the slug' do
      customer = build :customer, slug: ''
      expect(customer).not_to be_valid
      expect(customer.errors.messages[:slug]).to include("can't be blank")
    end

    it 'should validate uniqueness of the slug' do
      customer = create :customer
      invalid_customer = build :customer, slug: customer.slug
      expect(invalid_customer).not_to be_valid
    end

    it 'should validate name only contains characters' do
      customer = build :customer
      expect(customer).to be_valid, "should only contain characters"
    end

    it 'should validate gender only contains characters' do
      customer = build :customer, gender: Faker::Number.number(10)
      expect(customer).not_to be_valid, "should only contain characters"
    end

    it 'should validate age only contains numbers' do
      customer = build :customer
      expect(customer).to be_valid, "should only contain numbers"
    end

    it 'should validate age length' do
      customer = build :customer, age: Faker::Number.number(4)
      expect(customer).not_to be_valid, "should only be 1-3 chars long"
    end

    it 'should validate country only contains characters' do
      customer = build :customer, country: Faker::Number.number(10)
      expect(customer).not_to be_valid, "should only contain numbers"
    end

    it 'should validate country length' do
      customer = build :customer, country: Faker::Nation.nationality
      expect(customer).not_to be_valid, "should only be 2 or 3 chars long"
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
