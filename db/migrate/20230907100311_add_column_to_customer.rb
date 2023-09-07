# frozen_string_literal: true

# Add new column
class AddColumnToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :registration_date, :date
  end
end
