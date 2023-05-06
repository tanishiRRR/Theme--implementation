class Item < ApplicationRecord

  # カート内商品
  has_many :cart_items, dependent: :destroy

  # 注文詳細
  has_many :order_details, dependent: :destroy

  # ジャンル
  belongs_to :genre

  # 画像投稿機能
  has_one_attached :image

  # 画像を表示する関数を定義
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def with_tax_price
    (price * 1.1).floor
  end

  # 検索機能用
  def self.search_for(content)
    Item.where('name LIKE ?', '%'+content+'%')
  end

end
