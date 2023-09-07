# frozen_string_literal: true

# Create Payment class
class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.integer :total
      t.references :customer, null: false, default: 0, foreign_key: true

      t.timestamps
    end
  end
end
