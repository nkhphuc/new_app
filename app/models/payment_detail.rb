# frozen_string_literal: true

# PaymentDetail class
class PaymentDetail < ApplicationRecord
  belongs_to :payment
end
