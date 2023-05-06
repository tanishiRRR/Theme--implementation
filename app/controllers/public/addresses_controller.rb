class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!, only: [:index, :edit, :create, :update, :destroy]
  before_action :customer_scan, only: [:index, :edit, :create, :update, :destroy]

  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
      flash[:notice] = "カートに商品が入りました"
      redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    @address.save
      flash[:notice] = "配送先を編集しました"
      redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
    def address_params
      params.require(:address).permit(:customer_id, :name, :postal_code, :address)
    end

    def customer_scan
      unless current_customer
        redirect_to customers_my_page_path
      end
    end

end
