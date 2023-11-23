class AddPriceToToy < ActiveRecord::Migration[7.0]
  def change
    add_column :toys, :price, :decimal
  end
end
