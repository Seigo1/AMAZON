class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :user_id, null: false
      t.integer :value, null: false, default: 0
      t.timestamps null: false
    end
  end
end
