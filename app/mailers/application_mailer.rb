class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('SENDER_EMAIL', nil)
  layout 'mailer'

  def format_mail_address(user)
    address = Mail::Address.new user.email
    address.display_name = user.name

    address.format
  end
end
