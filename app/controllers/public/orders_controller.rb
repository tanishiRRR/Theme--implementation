class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

   # 注文情報入力画面
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  # 注文情報入力確認画面
  def comfirm
    @order = Order.new(order_params)
    # if文を記述して、hidden fieldが作動するようにする。
    # ご自身の住所と配送先住所が選択された場合はhiddenで処理

    # 現在memberに登録されている住所であれば
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    # collection.selectであれば
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:customer_id])
　　　#orderのcustomer_id(=カラム)でアドレス(帳)を選び、そのデータ送る
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    # 新規住所入力であれば
    elsif params[:order][:address_option] = "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end

    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
  end

  # 注文完了画面
  def complete
  end

  # 注文確定処理
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    # orderdetailの保存
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @orderdetail = OrderDetail.new #初期化宣言
      @orderdetail.order_id =  @order.id #注文商品に注文idを紐付け
      @orderdetail.item_id = cart_item.item_id #商品idを注文商品idに代入
      @orderdetail.price = cart_item.item.with_tax_price #消費税込みに計算して代入
      @orderdetail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
      @orderdetail. = cart_item.amount #商品の個数を注文商品の個数に代入
      @orderdetail.save #注文商品を保存
    end #ループ終わり

    current_customer.cart_items.destroy_all #カートの中身を削除
    redirect_to orders_complete_path
  end

  # 注文情報履歴一覧
  def index
    @orders = current_customer.orders
  end

  # 注文情報詳細
  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.order_details
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    end

end
