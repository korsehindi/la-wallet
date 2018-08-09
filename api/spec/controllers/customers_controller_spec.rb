require "rails_helper"

RSpec.describe CustomersController do
  describe '#index ' do
    it 'should return success responde' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :customer, 2
      get :index
      # Expect a valid JSON format
      json = JSON.parse(response.body)
      pp json
      # Extract the data content into a variable
      #json_data = json[:data]
      #expect(json_data.length).to eq(2)
    end
  end
end
