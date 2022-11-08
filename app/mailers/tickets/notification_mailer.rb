module Tickets
  class NotificationMailer < ApplicationMailer
    def send_reminder(ticket)
      @ticket = ticket
      @user = ticket.user

      @ticket_url = "/tickets/#{ticket.id}"

      mail_options = {
        to: format_mail_address(@user),
        subject: I18n.t('mailer.tickets.notification_mailer.send_reminder.subject',
                        ticket_title: ticket.title)
      }

      mail mail_options
    end
  end
end
