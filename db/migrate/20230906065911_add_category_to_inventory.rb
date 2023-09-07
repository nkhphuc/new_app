# frozen_string_literal: true

# Add Category ref to Inventory
class AddCategoryToInventory < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :category, null: false, default: 0, foreign_key: true
  end
end
