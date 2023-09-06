# frozen_string_literal: true

# Inventory class
class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :category
end
