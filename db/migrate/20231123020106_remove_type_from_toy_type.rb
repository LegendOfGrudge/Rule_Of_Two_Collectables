class RemoveTypeFromToyType < ActiveRecord::Migration[7.0]
  def change
    remove_column :toy_types, :type, :string
  end
end
