class Deal < ApplicationRecord
  # ActiveRecord Associations
  belongs_to :sender_wallet, class_name: "Wallet"
  belongs_to :recipient_wallet, class_name: "Wallet"

  # Constants
  VALID_TEXT_REGEX = /\A[a-zA-Z -]+\z/

  # Mandatory attributes
  validates :amount,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :message,
            presence: false,
            length: { maximum: 128 },
            format: { with: VALID_TEXT_REGEX }
  validates :date,
            presence: true
  validates :sender_wallet_id,
            presence: true,
            exclusion: {
              in: -> (deal) { [deal.recipient_wallet_id] }
            }
  validates :recipient_wallet_id,
            presence: true,
            exclusion: {
              in: -> (deal) { [deal.sender_wallet_id] }
            }
end
