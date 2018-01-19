class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :product_group
  validates_presence_of :quantity, :product_id

end
