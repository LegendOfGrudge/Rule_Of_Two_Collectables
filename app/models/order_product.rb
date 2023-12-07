class OrderProduct < ApplicationRecord
  belongs_to :toy
  belongs_to :order
end
