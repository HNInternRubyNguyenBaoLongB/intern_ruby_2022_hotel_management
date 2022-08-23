class BasketsController < ApplicationController
  before_action :find_bill, :filter_booking, only: :show

  def show; end

  private

  def filter_booking
    @pagy, @bookings = pagy Booking.find_booking_with_bill_id(@bill.id)
                                   .booking_order,
                            items: Settings.booking.booking_per_page,
                            link_extra: 'data-remote="true"'
  end

  def find_bill
    @bill = Bill.pending.find_bill(current_user.id).first
    return if @bill

    @bill = current_user.bills.build
    return if @bill.save

    flash[:danger] = t ".danger_save_bill"
    redirect_to root_path
  end
end
