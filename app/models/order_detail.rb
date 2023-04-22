class OrderDetail < ApplicationRecord

  # 注文
  belongs_to :order

  # 商品
  belongs_to :item

  enum status: { cannot_be_manufactured: 0, waiting_for_production: 1, in_production: 2, completion_of_production: 3 }

  def subtotal
    price * amount
  end

end
