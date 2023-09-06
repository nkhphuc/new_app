class Product < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :categories, through: :inventories
end
