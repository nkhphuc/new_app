# frozen_string_literal: true

# Add type column for STI
class AddColumnToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :type, :integer, null: false, default: 0
  end
end
