class Province < ApplicationRecord
  has_many :users

  validates :name, :abbr, :gst, :hst, :pst, presence: true
  validates :gst, :hst, :pst, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    ["abbr", "created_at", "gst", "hst", "id", "name", "pst", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["users"]
  end
end
