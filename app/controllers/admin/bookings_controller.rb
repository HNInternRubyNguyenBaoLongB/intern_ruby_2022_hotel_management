class Admin::BookingsController < Admin::AdminController
  def index
    @pagy, @bookings = pagy Booking.by_bills(params[:bill_id])
                                   .check_exist_booking(params[:start_date],
                                                        params[:end_date]),
                            items: Settings.bookings.booking_per_page
  end
end
