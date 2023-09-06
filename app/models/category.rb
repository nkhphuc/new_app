class Category < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories

  validates :name, presence: true, uniqueness: true
end
