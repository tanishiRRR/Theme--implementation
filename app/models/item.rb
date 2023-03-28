class Item < ApplicationRecord

  # カート内商品
  has_many :cart_items, dependent: :destroy

  # 注文詳細
  has_many :order_details, dependent: :destroy
  
  # ジャンル
  belongs_to :genres

  # 画像投稿機能
  has_one_attached :image

end
