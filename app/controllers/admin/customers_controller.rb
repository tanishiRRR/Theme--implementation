class Admin::CustomersController < ApplicationController
  before_action :admin_scan, only: [:index, :show, :edit, :update]

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.save
    flash[:notice] = "カート内商品を編集しました。"
    redirect_to admin_customer_path
  end

  private

  def admin_scan
    unless current_admin
      redirect_to new_admin_session_path
    end
  end

end
