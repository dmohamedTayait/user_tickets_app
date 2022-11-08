# frozen_string_literal: true

require 'rails_helper'

describe Notifications::Tickets::SendReminder do
  subject(:service) { described_class.new(ticket) }

  describe '#intialize' do
    context 'when calling reminder service' do
      let(:ticket) { create :ticket }

      it 'send a reminder email for the assigned user' do
        expect{service.call}.to have_enqueued_job(ActionMailer::MailDeliveryJob)
      end
    end
  end
end
