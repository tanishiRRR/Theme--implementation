class CartItem < ApplicationRecord

  # 会員
  belongs_to :customer

  # 商品
  belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end

end
