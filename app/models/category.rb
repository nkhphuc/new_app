# frozen_string_literal: true

# Category class
class Category < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories

  validates :name, presence: true, uniqueness: true

  before_save :capitalize_name

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
