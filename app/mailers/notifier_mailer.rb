class NotifierMailer < ApplicationMailer
  def response(recipient)
    @account = recipient
    mail(to: @account, subject: "New reply has been posted")
  end
end
