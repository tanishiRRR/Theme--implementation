class Public::OrdersController < ApplicationController
  before_action :authenticate_member!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def comfirm
    @order = Order.new(order_params)
    # @orderはでかい箱で、その中に小さい箱を指定するためにストロングパラメーターを指定している。

    # if文を記述して、hidden fieldが作動するようにする。
    # ご自身の住所と配送先住所が選択された場合はhiddenで処理

    # 現在memberに登録されている住所であれば
    if params[:address_option] == "0"
      @order.postal_code = current_costomer.postal_code
      @order.address = current_costomer.address
      @order.name = current_costomer.last_name + current_customer.first_name

    # collection.selectであれば
    elsif params[:address_option] == "1"
      @address = Address.find(params[:customer_id])
　　　#orderのcustomer_id(=カラム)でアドレス(帳)を選び、そのデータ送る
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    # 新規住所入力であれば
    elsif params[:address_option] = "2"
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    else
      render 'new'
    end

    @cart_items = current_costomer.cart_items.all
    @order.customer_id = current_customer.id
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end
