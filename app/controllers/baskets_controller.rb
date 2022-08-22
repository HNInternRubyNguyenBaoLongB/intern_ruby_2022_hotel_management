class BasketsController < ApplicationController
  before_action :find_booking, :filter_booking, only: :show

  def show; end

  private

  def find_booking
    @booking = Booking.find_booking(current_user.id)
    return if @booking

    flash[:danger] = t ".alert_booking"
    redirect_to root_path
  end

  def filter_booking
    @pagy, @bookings = pagy Booking.booking_order,
                            items: Settings.booking.booking_per_page,
                            link_extra: 'data-remote="true"'
  end
end
