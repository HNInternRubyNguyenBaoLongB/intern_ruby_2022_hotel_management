# Preview all emails at http://localhost:3000/rails/mailers/send_bill_mailer
class SendBillMailerPreview < ActionMailer::Preview
  def bill_mail_preview
    SendBillMailer.send_bill_mail(Bill.first)
  end
end
