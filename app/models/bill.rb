class Bill < ApplicationRecord
  CREATABLE_ATTR = %i(total_price user_id discount_id).freeze

  has_many :bookings, dependent: :destroy
  belongs_to :user
end
