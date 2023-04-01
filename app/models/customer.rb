class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # ログイン機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # カート内商品
  has_many :cart_items, dependent: :destroy

  # 注文
  has_many :orders, dependent: :destroy

  # 配送先
  has_many :addresses, dependent: :destroy

end
