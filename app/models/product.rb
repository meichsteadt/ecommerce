class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :order_items
  belongs_to :product_group
  paginates_per 6

  def self.search(search)
    @products = Product.where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%").collect.to_a

    Category.where("lower(name) LIKE ?", "%#{search.downcase}%").each do |cat|
      cat.products.each do |product|
        unless @products.include?(product)
          @products << product
        end
      end
    end
    @products
  end
end
