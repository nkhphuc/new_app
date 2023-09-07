# frozen_string_literal: true

# Timeprice class
class Timeprice < ApplicationRecord
  has_many :menus, as: :menu, dependent: :destroy
end
