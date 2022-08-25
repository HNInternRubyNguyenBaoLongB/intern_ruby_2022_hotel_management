class Bill < ApplicationRecord
  CREATABLE_ATTR = %i(total_price user_id discount_id).freeze

  enum status: {
    pending: 0,
    checking: 1,
    confirm: 2,
    abort: 3,
    paid: 4
  }

  has_many :bookings, dependent: :destroy
  belongs_to :user

  delegate :name, :phone, to: :user, prefix: :user

  scope :recent_bills, ->{order(created_at: :asc)}
  scope :by_status, ->(status){where(status: status) if status.present?}
  scope :search_by_key, (lambda do |key|
                           joins(:user)
                           .where("users.name LIKE ?", "%#{key}%")
                           .or(where("users.phone LIKE ?", "%#{key}%"))
                         end)
end
