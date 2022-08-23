class Bill < ApplicationRecord
  CREATABLE_ATTR = %i(total_price user_id discount_id).freeze

  has_many :bookings, dependent: :destroy
  belongs_to :user

  scope :find_bill, ->(user_id){where user_id: user_id}

  enum status: {
    pending: 0,
    checking: 1,
    confirm: 2,
    abort: 3,
    paid: 4
  }
end
