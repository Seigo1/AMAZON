class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.integer :review_num, default: 0, null: false
      t.text :comment
      t.timestamps null: false
    end
  end
end
