class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  has_many :order_product

  validates :order_gst, :order_hst, :order_pst, :order_subtotal, :order_status_id, :user_id, presence: true
  validates :order_gst, :order_hst, :order_pst, :order_subtotal, :order_status_id, :user_id, numericality: true
  validates :order_status_id, :user_id, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_gst", "order_hst", "order_pst", "order_status_id", "order_subtotal", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_product", "order_status", "user"]
  end
end
