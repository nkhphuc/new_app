# frozen_string_literal: true

# Create Inventory model
class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer :stock

      t.timestamps
    end
  end
end
