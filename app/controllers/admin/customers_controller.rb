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
    customer.update(customer_params)
    customer.save
    flash[:notice] = "顧客情報を編集しました。"
    redirect_to admin_customer_path
  end

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
    end

    def admin_scan
      unless current_admin
        redirect_to new_admin_session_path
      end
    end

end
