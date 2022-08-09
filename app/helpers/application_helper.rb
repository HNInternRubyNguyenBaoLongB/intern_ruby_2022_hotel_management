module ApplicationHelper
  include Pagy::Frontend
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = "error" if type == "danger"
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text if message
    end
    flash_messages.join("\n")
  end
end
