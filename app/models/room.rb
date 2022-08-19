class Room < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank,
                                 allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :status, presence: true

  enum status: {
    avaiable: 0,
    booked: 1
  }

  enum type: {
    single: 0,
    double: 1,
    queen: 2,
    king: 3
  }

  scope :room_order, ->{order(id: :asc)}
  scope :by_rating, ->(rating){where(rate_avg: rating)}
end
