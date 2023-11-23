class RemovePriceDecimalFromToy < ActiveRecord::Migration[7.0]
  def change
    remove_column :toys, :price, :string
    remove_column :toys, :decimal, :string
  end
end
