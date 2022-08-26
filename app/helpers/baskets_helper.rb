module BasketsHelper
  def find_total_price bookings
    bookings.pluck("total_price").reduce :+
  end
end
