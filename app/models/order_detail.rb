class OrderDetail < ApplicationRecord

  # 注文
  belongs_to :orders

  # 商品
  belongs_to :items

  enum :status, { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

end
