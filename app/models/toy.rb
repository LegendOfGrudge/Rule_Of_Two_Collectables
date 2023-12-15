class Toy < ApplicationRecord
  belongs_to :toy_type
  belongs_to :collection

  validates :name, :full_name, :description, :quantity, :price, :collection_id, :toy_type_id, presence: true
  validates :quantity, :price, :collection_id, :toy_type_id, numericality: true
  validates :quantity, :collection_id, :toy_type_id, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["collection_id", "created_at", "description", "full_name", "id", "image", "name", "price", "quantity", "toy_type_id", "updated_at"]
  end
end
