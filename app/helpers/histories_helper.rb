module HistoriesHelper
  def check_status status
    {
      "pending": "chip info",
      "checking": "chip warning",
      "confirm": "chip primary",
      "abort": "chip danger",
      "paid": "chip info"
    }[status]
  end
end
