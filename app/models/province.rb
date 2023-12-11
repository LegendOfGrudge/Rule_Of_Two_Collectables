class Province < ApplicationRecord
  has_many :users

  def self.ransackable_attributes(auth_object = nil)
    ["abbr", "created_at", "gst", "hst", "id", "name", "pst", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["users"]
  end
end
