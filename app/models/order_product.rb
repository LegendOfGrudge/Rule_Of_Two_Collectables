class OrderProduct < ApplicationRecord
  belongs_to :toy
  belongs_to :order

  validates :product_cost, :product_quantity, :toy_id, :order_id, presence: true
  validates :product_cost, :product_quantity, :toy_id, :order_id, numericality: true
  validates :product_cost, :product_quantity, :toy_id, :order_id, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "product_cost", "product_quantity", "toy_id", "updated_at"]
  end
end
