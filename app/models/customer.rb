# frozen_string_literal: true

# Customer class
class Customer < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :phone_number, format: { with: /^\+\d+$/, multiline: true }
  validates :gender, inclusion: { in: %w[male female] }
  validates :plan, inclusion: { in: %w[free medium plus] }

  enum gender: { male: 0, female: 1 }
  enum plan: { free: 0, medium: 1, plus: 2 }

  def full_name
    "#{first_name} #{last_name}"
  end

  # scope :not_free, -> { where('plan != 0') } # this scope is provided by enum

  # query in rails console to find customers in Hue: Customer.where(address: 'Hue')
  scope :in_hue, -> { where('address = ?', 'Hue') }
  # rails console, check for first customer is free or not: Customer.find(1).free?
end
