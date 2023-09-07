# frozen_string_literal: true

# Payment class
class Payment < ApplicationRecord
  belongs_to :customer
end
