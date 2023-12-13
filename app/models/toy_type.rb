class ToyType < ApplicationRecord
  has_many :toys

  validates :type_name, presence: true

  # For refactor purpose:
  # I have suggested the following solution (def to_s) for an issue that we have fixed previously
  # where the object was being displayed instead of its name
  def to_s
    self.type_name
  end


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "type_name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["toys"]
  end
end
