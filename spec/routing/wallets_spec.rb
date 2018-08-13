require "rails_helper"

RSpec.describe 'wallets routes' do
  it 'should route to wallets index' do
    expect(get '/wallets').to route_to('wallets#index')
  end

  it 'should route to wallets show' do
    expect(get '/wallets/1').to route_to('wallets#show', id: '1')
  end
end
