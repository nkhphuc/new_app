# frozen_string_literal: true

# Create Coupon class
class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
