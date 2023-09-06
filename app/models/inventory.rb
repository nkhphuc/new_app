# frozen_string_literal: true

# Inventory class
class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  scope :products_in_cat, -> (cat_id) { where("category_id = ?", cat_id) }
end
