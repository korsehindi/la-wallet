class CustomersController < ApplicationController
  def index
    customers = Customer.recent
    render json: customers
  end

  def show
  end
end
