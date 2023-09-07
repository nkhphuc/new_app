# frozen_string_literal: true

# Create Timeprice class
class CreateTimeprices < ActiveRecord::Migration[7.0]
  def change
    create_table :timeprices do |t|
      t.string :name
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
