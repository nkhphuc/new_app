# frozen_string_literal: true

# Add type column for STI
class AddColumnToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :type, :integer, null: false, default: 0
  end
end
