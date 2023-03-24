class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|

      t.string :last_name, null: false # 姓
      t.string :first_name, null: false # 名
      t.string :last_name_kana, null: false # 姓カナ
      t.string :first_name_kana, null: false # 名カナ
      t.string :email, null: false # メールアドレス
      t.string :encrypted_password, null: false # パスワード
      t.string :postal_code, null: false  # 郵便番号
      t.string :address, null: false # 住所
      t.string :telephone_number, null: false # 電話番号
      t.boolean :is_deleted, default: false, null: false # 会員ステータス

      t.timestamps
    end
  end
end
