class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_number, null: false
      t.datetime :order_date
      t.integer :order_status
      t.decimal :total_price, precision: 10, scale: 2, null: false
      t.string :payment_method
      t.integer :payment_status
      t.text :shipping_address

      t.timestamps
    end
  end
end
