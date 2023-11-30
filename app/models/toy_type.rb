class ToyType < ApplicationRecord
  has_many :toys

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "type_name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["toys"]
  end
end
