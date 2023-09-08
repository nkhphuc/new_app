# frozen_string_literal: true

# Product class
class Product < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :categories, through: :inventories

  validates :name, presence: true
  validates :price, presence: true

  def out_of_stock?
    inventories.sum(&:stock) <= 5
  end

  enum type: { 'Phone' => 0, 'Camera' => 1, 'Computer' => 2 }
  serialize :properties
end
