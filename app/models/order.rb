class Order < ApplicationRecord
  has_many :order_items
  before_save :update_total
  before_create :update_status

  def total_items
    self.order_items.collect { |item| item.quantity }.sum
  end

  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  def includes_item?(item)
    self.order_items.each do |oi|
      if oi.product_id == item.product_id
        return true
      end
    end
    false
  end

private

  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end
end
