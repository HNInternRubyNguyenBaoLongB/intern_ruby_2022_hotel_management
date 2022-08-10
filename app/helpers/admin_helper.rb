module AdminHelper
  def bill_status_options
    statuses = Bill.statuses.to_a
    statuses.unshift ["All", ""]
    statuses
  end
end
