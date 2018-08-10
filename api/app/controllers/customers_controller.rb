class CustomersController < ApplicationController
  def index
    customers = Customer.recent.page(params[:page]).per(params[:per_page])
    render json: customers
  end

  def show
  end
end
