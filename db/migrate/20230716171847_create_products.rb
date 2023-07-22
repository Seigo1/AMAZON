class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|

      t.string :name, null: false
      t.string :image_id
      t.text :introduction
      t.integer :quantity, null: false, default: 0
      t.integer :value, null: false, default: 0
      t.timestamps null: false
    end
  end
end
