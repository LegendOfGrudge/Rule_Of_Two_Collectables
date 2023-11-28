class AddTypeNametoToyType < ActiveRecord::Migration[7.0]
  def change
    add_column :toy_types, :type_name, :string
  end
end
