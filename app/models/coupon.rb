# frozen_string_literal: true

# Coupon class
class Coupon < ApplicationRecord
  has_many :menus, as: :menu, dependent: :destroy
end
