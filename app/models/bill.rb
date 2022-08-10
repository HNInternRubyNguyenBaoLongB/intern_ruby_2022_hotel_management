class Bill < ApplicationRecord
  CREATABLE_ATTR = %i(total_price user_id discount_id).freeze

  has_many :bookings, dependent: :destroy
  belongs_to :user

  enum status: {
    pending: 0,
    checking: 1,
    confirm: 2,
    abort: 3,
    paid: 4
  }

  has_many :bookings, dependent: :destroy
  belongs_to :user

  delegate :name, :phone, :email, to: :user, prefix: :user

  scope :recent_bills, ->{order(created_at: :asc)}
  scope :by_status, ->(status){where(status: status) if status.present?}
  scope :search_by_key, (lambda do |key|
                           joins(:user)
                           .where("users.name LIKE ?", "%#{key}%")
                           .or(where("users.phone LIKE ?", "%#{key}%"))
                         end)
  scope :by_current_user, ->(user_id){where user_id: user_id}
  scope :find_bill_was_payment, ->{where.not(status: :pending)}
  scope :find_bill_with_booking, ->(bill_id){where id: bill_id}
end
