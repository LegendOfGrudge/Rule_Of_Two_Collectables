class Collection < ApplicationRecord
  belongs_to :brand
  has_many :toys

  validates :name, :description, :brand_id, presence: true
  validates :brand_id, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["brand_id", "created_at", "description", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["brand", "toys"]
  end
end
