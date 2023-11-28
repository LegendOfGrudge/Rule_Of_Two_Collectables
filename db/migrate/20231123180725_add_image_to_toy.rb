class AddImageToToy < ActiveRecord::Migration[7.0]
  def change
    add_column :toys, :image, :string
  end
end
