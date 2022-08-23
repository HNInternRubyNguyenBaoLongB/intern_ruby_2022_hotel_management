module Admin::RoomsHelper
  def show_booking id
    date = ""
    @booking = Booking.where(room_id: id)
    return "" if @booking.blank?

    @booking.each do |b|
      date += "#{b.start_date.strftime('%FT%T')} / "
      date += "#{b.end_date.strftime('%FT%T')} \n"
    end

    date
  end
end
