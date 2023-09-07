# frozen_string_literal: true

# Customer class
class Customer < ApplicationRecord
  has_many :payments, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :phone_number, format: { with: /^\+\d+$/, multiline: true }

  enum gender: { male: 0, female: 1 }
  enum plan: { free: 0, medium: 1, plus: 2 }

  def full_name
    "#{first_name} #{last_name}"
  end

  # scope :not_free, -> { where('plan != 0') } # this scope is provided by enum

  # query in rails console to find customers in Hue: Customer.where(address: 'Hue')
  scope :in_hue, -> { where('address = ?', 'Hue') }
  # rails console, check for first customer is free or not: Customer.find(1).free?
  scope :reg_in22, -> { where(registration_date: '2022-1-1'.to_date..'2022-12-31'.to_date) }
end
