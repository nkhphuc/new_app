# frozen_string_literal: true

# Add Product ref to Inventory
class AddProductToInventory < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :product, null: false, default: 0, foreign_key: true
  end
end
