# frozen_string_literal: true

require 'rails_helper'

describe Tickets::NotificationMailer do
  let(:ticket) { create(:ticket) }

  describe '#send_due_date_reminder' do
    subject(:mail) do
      described_class.send_reminder(ticket)
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([ticket.user.email])
    end

    it 'builds up the email subject' do
      expect(mail.subject).to eq(I18n.t('mailer.tickets.notification_mailer.send_reminder.subject',
                                         ticket_title: ticket.title))
    end

    it 'renders the body' do
      expect(mail.body.encoded)
        .to include(I18n.t('mailer.tickets.notification_mailer.send_reminder.paragraph',
                            ticket_title: ticket.title, due_date: ticket.due_date))
    end

    it '#deliver_now' do
      expect { mail.deliver_now }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
