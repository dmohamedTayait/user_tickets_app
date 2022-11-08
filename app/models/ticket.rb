# frozen_string_literal: true

class Ticket < ApplicationRecord
  after_create :send_notification

  validates :title, presence: true

  belongs_to :user

  enum status: { todo: 1, in_progress: 2, done: 3 }

  private

  def send_notification
    return unless user&.send_due_date_reminder

    Notifications::Tickets::SendReminder.new(self).call
  end
end
