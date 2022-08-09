module BookingsHelper
  def check_status status
    {
      "pending": "chip info",
      "checking": "chip warning",
      "confirm": "chip primary",
      "abort": "chip danger"
    }[status]
  end
end
