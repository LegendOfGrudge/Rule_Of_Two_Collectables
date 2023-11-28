class AddDescriptionToBrand < ActiveRecord::Migration[7.0]
  def change
    add_column :brands, :description, :string
  end
end
