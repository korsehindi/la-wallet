class Wallet < ApplicationRecord
  # Constants
  VALID_TEXT_REGEX = /\A[a-zA-Z]+\z/
  belongs_to :customer

  # Mandatory attributes
  validates :customer,
            presence: true
  validates :address,
            presence: true,
            uniqueness: true,
            length: { is: 64 }
  validates :balance,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :alias,
            presence: false,
            length: { maximum: 128 },
            format: { with: VALID_TEXT_REGEX }
end
