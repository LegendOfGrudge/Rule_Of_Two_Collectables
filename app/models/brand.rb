class Brand < ApplicationRecord
  has_many :collections

  validates :name, :description, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["collections"]
  end
end
