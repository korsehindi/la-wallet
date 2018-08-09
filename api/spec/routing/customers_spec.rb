require "rails_helper"

RSpec.describe 'customers routes' do
  it 'should route to customers index' do
    expect(get '/customers').to route_to('customers#index')
  end

  it 'should route to customers show' do
    expect(get '/customers/1').to route_to('customers#show', id: '1')
  end
end
