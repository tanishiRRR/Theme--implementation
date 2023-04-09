class Public::CartItemsController < ApplicationController

  # ログインしている顧客のみが特定の内容を扱えるように制限
  before_action :customer_scan, only: [:create, :update, :destroy]

  def index
  end

  def update

  end

  def destroy
  end

  def destroy_all
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
      redirect_to cart_items_path, notice:"カートに商品が入りました"
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
