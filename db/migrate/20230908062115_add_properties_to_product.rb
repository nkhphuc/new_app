# frozen_string_literal: true

# Add properties column to Product
class AddPropertiesToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :properties, :text
  end
end
