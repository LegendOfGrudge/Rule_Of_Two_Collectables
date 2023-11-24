class Toy < ApplicationRecord
  belongs_to :toy_type
  belongs_to :collection

  validates :name, :full_name, :description, :quantity, :price, presence: true
  validates :quantity, :price, numericality: true
end
