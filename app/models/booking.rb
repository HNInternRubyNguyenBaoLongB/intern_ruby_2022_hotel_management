class Booking < ApplicationRecord
  CREATABLE_ATTRS = %i(room_id bill_id total_price start_date end_date).freeze

  belongs_to :user
  belongs_to :room
  belongs_to :bill

  scope :booking_order, ->{order(id: :asc)}
  scope :find_booking, ->(user_id){where user_id: user_id}
  scope :check_exist_booking,
        (lambda do |start_date, end_date|
          select("room_id")
          .where("bookings.end_date > :start_date
                AND bookings.start_date < :end_date",
                 start_date: start_date, end_date: end_date)
        end)
  scope :find_booking_with_bill_id, ->(bill_id){where("bill_id = #{bill_id}")}
  scope :find_room_with_id, ->(room_id){where room_id: room_id}
  scope :check_exist_booking_with_room_ids,
        (lambda do |room_ids|
          where("room_id IN (?)", room_ids)
        end)
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

  enum status: {
    pending: 0,
    checking: 1,
    confirm: 2,
    abort: 3
  }
end
