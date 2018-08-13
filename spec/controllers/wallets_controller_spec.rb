require "rails_helper"

RSpec.describe WalletsController do
  describe '#index ' do
    subject { get :index }

    it 'should return success respond' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :wallet, 2
      subject
      Wallet.recent.each_with_index do |wallet, index|
        expect(json_data[index]['attributes']).to eq({
          "customer-id" => wallet.customer_id,
          "address" => wallet.address,
          "balance" => wallet.balance.to_s,
          "alias" => wallet.alias
                                                     })
      end
    end

    it 'should return wallets in the proper order' do
      old_wallet = create :wallet
      newer_wallet = create :wallet
      subject
      expect(json_data.first['id']).to eq(newer_wallet.id.to_s)
      expect(json_data.first['id']).not_to eq(old_wallet.id.to_s)
    end

    it 'should paginate results' do
      create_list :wallet, 3
      get :index, params: { page: 2, per_page: 1 }
      pp json
      expect(json_data.length).to eq 1
      expected_wallet = Wallet.recent.second.id.to_s
      expect(json_data.first['id']).to eq(expected_wallet)
    end
  end
end
