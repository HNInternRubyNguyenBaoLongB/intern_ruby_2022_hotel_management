class Admin::BillsController < Admin::AdminController
  def index
    @pagy, @bills = pagy Bill.by_status(params[:status])
                             .search_by_key(params[:key])
                             .recent_bills,
                         items: Settings.bills.bill_per_page
  end
end
