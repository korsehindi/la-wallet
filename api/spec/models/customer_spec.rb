require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build :customer, email: 'foo@bar.baz', password_digest: 'foobarbaz', title: 'Miss', country: 'MX').to be_valid
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
      customer = create :customer, email: 'foo@bar.baz', password_digest: 'foobarbaz', title: 'Miss', country: 'MX'
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
      customer = create :customer, email: 'foo@bar.baz', password_digest: 'foobarbaz', title: 'Miss', country: 'MX'
      invalid_customer = build :customer, slug: customer.slug
      expect(invalid_customer).not_to be_valid
    end
  end
end
