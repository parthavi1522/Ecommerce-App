class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :quantity, default: 1, null: false

      t.timestamps
    end

    add_index :cart_items, [:cart_id, :product_id], unique: true, name: 'unique_cart_item'
  end
end
