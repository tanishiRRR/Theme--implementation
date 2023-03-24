class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :price, null: false # 購入時価格
      t.integer :amount, null: false # 数量
      t.integer :making_status, null: false  # 製造ステータス


      t.timestamps
    end
  end
end
