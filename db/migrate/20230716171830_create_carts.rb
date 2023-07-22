class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|

      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false, default: 0
      t.boolean :is_active, null: false, default: true
      t.timestamps null: false
    end
  end
end
