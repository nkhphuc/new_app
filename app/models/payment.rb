# frozen_string_literal: true

# Payment class
class Payment < ApplicationRecord
  belongs_to :customer
  has_many :payment_details, dependent: :destroy
  accepts_nested_attributes_for :payment_details


  before_save :set_total

  def set_total
    self.total = payment_details.map(&:menu).sum(&:price)
  end

  # Example Payment:
  # payment = { name: 'payment_name2', customer_id: 1, payment_details_attributes: [{ menu_type: 'Timeprice', menu_id: 1 }, { menu_type: 'Coupon', menu_id: 1 }] }
end
