class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # ログイン機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 画像投稿機能
  has_one_attached :image

end
