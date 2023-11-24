class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
