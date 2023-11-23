class Collection < ApplicationRecord
  belongs_to :brand
  has_many :toys
end
