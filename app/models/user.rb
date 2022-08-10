class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bills, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true,
  length: {maximum: Settings.user.name.max_length}

  validates :email, presence: true,
  length: {
    minimum: Settings.user.email.min_length,
    maximum: Settings.user.email.max_length
  },
    format: {with: Settings.user.email.regex_format}

  validates :password, presence: true, length:
    {minimum: Settings.user.password.min_length}, if: :password

  validates :phone, presence: true,
            format: {with: Settings.user.phone.regex_format}

  enum role: {
    user: 0,
    admin: 1
  }
  has_secure_password
end
