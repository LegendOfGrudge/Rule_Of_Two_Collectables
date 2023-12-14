class OrderProduct < ApplicationRecord
  belongs_to :toy
  belongs_to :order

  validates :product_cost, :product_quantity, presence: true
  validates :product_cost, :product_quantity, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "product_cost", "product_quantity", "toy_id", "updated_at"]
  end
end
