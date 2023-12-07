class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.references :toy, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :product_cost
      t.integer :product_quantity

      t.timestamps
    end
  end
end
