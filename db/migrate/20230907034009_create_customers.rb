# frozen_string_literal: true

# Create Customer class
class CreateCustomers < ActiveRecord::Migration[7.0]
  def up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ''
      t.string :phone_number
      t.integer :gender, null: false, default: 0
      t.date :birthday
      t.integer :plan, null: false, default: 0
      t.string :address

      t.timestamps
    end

    add_index :customers, :email, unique: true
  end

  def down
    remove_index :customers, :email, if_exists: true

    drop_table :customers
  end
end
