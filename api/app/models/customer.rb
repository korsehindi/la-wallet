class Customer < ApplicationRecord
  # Constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_AGE_REGEX = /\A[+-]?\d+\z/ # Accept integer only
  VALID_TEXT_REGEX = /[a-z]/i
  VALID_COUNTRY_REGEX = /[A-Z]/
  # Mandatory atributes
  validates :email,
            presence: true,
            uniqueness: true,
            length: { minimum: 6, maximum: 50},
            format: { with: VALID_EMAIL_REGEX }
  validates :password_digest,
            presence: true
  validates :slug,
            presence: true,
            uniqueness: true
  # Optional atributes
  validates :name,
            presence: false,
            length: { minimum: 2, maximum: 50 }
  validates :title,
            presence: false,
            length: { minimum: 2, maximum: 5 },
            format: { with: VALID_TEXT_REGEX, message: "Text only, minimum length: 2, maximum length: 4." }
  validates :gender,
            presence: false,
            length: { maximum: 10 },
            format: { with: VALID_TEXT_REGEX, message: "Text only." }
  validates :age,
            presence: false,
            length: { maximum: 3 },
            format: { with: VALID_AGE_REGEX, message: "Integer only." }
  validates :country,
            length: { minimum: 2, maximum: 3 },
            presence: false,
            format: { with: VALID_COUNTRY_REGEX, message: "Country codes are 2 or 3 digits long." }
end
