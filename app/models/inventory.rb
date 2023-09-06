# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :category
end
