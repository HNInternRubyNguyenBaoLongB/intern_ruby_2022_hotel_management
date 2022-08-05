class Bill < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  belongs_to :discount
end
