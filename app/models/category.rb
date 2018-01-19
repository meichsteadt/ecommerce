class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :products
  paginates_per 6
end
