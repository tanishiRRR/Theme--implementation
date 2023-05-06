class Public::CartItemsController < ApplicationController

  # ログインしている顧客のみが特定の内容を扱えるように制限
  before_action :customer_scan, only: [:index, :update, :destroy, :destroy_all, :create]

  def index
    @cart_items = current_customer.cart_items.all
    # カートに入ってる商品の合計金額
    @total = @cart_items.inject(0){ |sum, item| sum + item.subtotal }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @cart_item.save
      flash[:notice] = "カート内商品を編集しました。"
      redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          new_amount = cart_item.amount + @cart_item.amount
          cart_item.update_attribute(:amount, new_amount)
          @cart_item.delete
        end
      end
    @cart_item.save
      flash[:notice] = "カートに商品が入りました"
      redirect_to cart_items_path
  end

  # 投稿データのストロングパラメータ
private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

  def customer_scan
    unless current_customer
      redirect_to new_customer_session_path
    end
  end
end
