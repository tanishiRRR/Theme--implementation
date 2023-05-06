class Genre < ApplicationRecord

  # 商品
  has_many :items, dependent: :destroy

end
