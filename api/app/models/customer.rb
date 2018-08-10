class Customer < ApplicationRecord
  # Constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Mandatory attributes
  validates :login,
            presence: true,
            uniqueness: true
  validates :name,
            presence: true
  validates :url,
            presence: true,
            uniqueness: true
  validates :avatar_url,
            presence: true
  validates :provider,
            presence: true
  validates :slug,
            presence: true,
            uniqueness: true

  # Optional attributes
  validates :email,
            presence: false,
            uniqueness: true,
            length: { minimum: 6 },
            format: { with: VALID_EMAIL_REGEX }

  # Order newly registered users first
  scope :recent, -> { order(created_at: :desc ) }
end
