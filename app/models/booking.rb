class Booking < ApplicationRecord
  CREATABLE_ATTRS = %i(room_id bill_id total_price start_date end_date).freeze

  enum status: {
    pending: 0,
    confirm: 1,
    abort: 2
  }

  delegate :name, :images, :rate_avg, :price, to: :room, prefix: :room

  scope :booking_order, ->{order(id: :asc)}
  scope :find_booking, ->(user_id){where user_id: user_id}
  scope :check_exist_booking,
        (lambda do |start_date, end_date|
          if start_date.present? && end_date.present?
            where("end_date > :start_date AND start_date < :end_date",
                  start_date: start_date, end_date: end_date)
          end
        end)

  scope :find_room_with_id, ->(room_id){where room_id: room_id}

  def calculate_total_price booking, room
    (booking.end_date.to_date -
      booking.start_date.to_date).to_i * room.price
  end

  def booking_ids start_date, end_date, user_id
    @room_ids_checking = Booking.checking.check_exist_booking(
      start_date, end_date
    ).pluck("room_id")
    @room_ids_pending = Room.by_between_date(start_date,
                                             end_date,
                                             user_id).pluck("room_id")
    @room_ids_checking + @room_ids_pending
  end
end
