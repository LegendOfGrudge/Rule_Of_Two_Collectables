class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :order_subtotal
      t.integer :order_gst
      t.integer :order_pst
      t.integer :order_hst

      t.timestamps
    end
  end
end
