class AddStripeIdColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :stripe_id, :string
  end
end
