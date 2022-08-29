class SendBillMailer < ApplicationMailer
  def send_bill_mail bill
    @bill = bill
    mail to: @bill.user_email, subject: t(".subject")
  end
end
