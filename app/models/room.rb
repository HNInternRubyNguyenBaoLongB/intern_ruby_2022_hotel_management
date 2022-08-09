class Room < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :images

  validates :name, presence: true
  validates :price, presence: true
  validates :status, presence: true

  scope :room_order, ->{order(id: :asc)}
  scope :by_rating, ->(rating){where(rate_avg: rating)}

  enum status: {
    avaiable: 0,
    booked: 1
  }
end
