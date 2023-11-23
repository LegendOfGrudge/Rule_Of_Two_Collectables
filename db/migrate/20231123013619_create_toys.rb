class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.string :full_name
      t.text :description
      t.integer :quantity
      t.string :price
      t.string :decimal
      t.references :toy_type, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
