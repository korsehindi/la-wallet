require "rails_helper"

RSpec.describe CustomersController do
  describe '#index ' do
    subject { get :index }

    it 'should return success respond' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :customer, 2
      subject
      Customer.recent.each_with_index do |customer, index|
        expect(json_data[index]['attributes']).to eq({
          "name" => customer.name,
          "url" => customer.url,
          "avatar-url" => customer.avatar_url,
          "provider" => customer.provider,
          "slug" => customer.slug,
          "email" => customer.email,
          "location" => customer.location
                                                     })
      end
    end

    it 'should return customers in the proper order' do
      old_customer = create :customer
      newer_customer = create :customer
      subject
      expect(json_data.first['id']).to eq(newer_customer.id.to_s)
      expect(json_data.first['id']).not_to eq(old_customer.id.to_s)
    end

    it 'should paginate results' do
      create_list :customer, 3
      get :index, params: { page: 2, per_page: 1 }
      expect(json_data.length).to eq 1
      expected_customer = Customer.recent.second.id.to_s
      expect(json_data.first['id']).to eq(expected_customer)
    end
  end
end
