module RoomsHelper
  def render_star star
    temp = ""
    stared = star.to_i
    stared.times do
      temp += '<i class="iconify icon-star-full"
              data-icon="icomoon-free:star-full"></i>'
    end

    (Settings.room.rating_max - stared).times do
      temp += '<i class="iconify icon-star-empty"
              data-icon="icomoon-free:star-empty"></i>'
    end
    temp
  end

  def build_review
    @review = current_user.reviews.build
  end

  def check_booked room_id
    Booking.confirm.check_user_booking_confirm(
      current_user.id, room_id
    ).blank?
  end
end
