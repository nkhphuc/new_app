# frozen_string_literal: true

# Payment class
class Payment < ApplicationRecord
  belongs_to :customer
  has_many :payment_details, dependent: :destroy
end
