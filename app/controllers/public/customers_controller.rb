class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit, :update, :unsubscribe, :withdraw]

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private
    def is_matching_login_customer
      customer_id = params[:id].to_i
      unless customer_id == current_customer.id
        redirect_to customers_my_page_path(current_customer.id)
      end
    end
end
