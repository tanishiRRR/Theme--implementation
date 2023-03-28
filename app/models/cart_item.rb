class CartItem < ApplicationRecord

  # 会員
  belongs_to :customer

  # 商品
  belongs_to :item

end
