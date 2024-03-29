class Wallet < ApplicationRecord
  # ActiveRecord associations
  belongs_to :customer
  has_many :deals

  # Constants
  VALID_TEXT_REGEX = /\A[a-zA-Z -]+\z/

  # Mandatory attributes
  validates :customer_id,
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
            length: { maximum: 64 },
            format: { with: VALID_TEXT_REGEX }

  # Order newly created wallets first
  scope :recent, -> { order(created_at: :desc ) }
end
