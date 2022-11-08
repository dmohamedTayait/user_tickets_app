module Notifications
  module Tickets
    class SendReminder
      # include Service
      include ActiveModel::Validations

      attr_reader :ticket

      validates :ticket, presence: true

      def initialize(ticket)
        @ticket = ticket
      end

      def call
        return false unless valid?

        send_email
      rescue ActiveRecord::RecordInvalid => e
        errors.add(:base, e.message)
        -1
      end

      private

      def send_email
        ::Tickets::NotificationMailer.send_reminder(ticket).deliver_later(wait_until: delivery_date)
      end

      def delivery_date
        time_now = Time.now.in_time_zone(ticket.user.time_zone)
        mail_reminder_time && mail_reminder_time > time_now ? mail_reminder_time : time_now
      end

      def mail_reminder_time
        user = ticket.user
        reminder_date = ticket.due_date - user.due_date_reminder_interval
        DateTime.new(reminder_date.year, reminder_date.month, reminder_date.day,
                     user.due_date_reminder_time.hour, user.due_date_reminder_time.min,
                     user.due_date_reminder_time.sec, user.time_zone)
      end
    end
  end
end
