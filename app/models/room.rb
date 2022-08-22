class Room < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank,
                                 allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true

  scope :room_order, ->{order(id: :asc)}
  scope :by_rating, ->(rating){where("rate_avg = ?", rating)}
  scope :recent_rooms, ->{order(created_at: :desc)}
  scope :by_description,
        (lambda do |description|
          if description.present?
            where("description LIKE ?", "%#{description}%")
          end
        end)
  scope :by_between_date,
        (lambda do |start_date, end_date|
          left_joins(:bookings)
          .select("room_id")
          .where("bookings.end_date > :start_date
                  AND bookings.start_date < :end_date",
                 start_date: start_date, end_date: end_date)
        end)
  scope :not_ids, ->(ids){where.not(id: ids)}

  enum types: {
    single: 0,
    double: 1,
    queen: 2,
    king: 3
  }

  scope :room_order, ->{order(id: :asc)}
  scope :by_rating, ->(rating){where(rate_avg: rating)}
end
