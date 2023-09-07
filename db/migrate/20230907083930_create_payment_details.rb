# frozen_string_literal: true

# Create PaymentDetail class
class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.references :payment, null: false, default: 0, foreign_key: true
      t.references :payment_detailable, polymorphic: true

      t.timestamps
    end
  end
end
