namespace :send_notification do
  desc 'Formular attributes Orders'
  task generate_basic_setup: :environment do
    Notifications::Tickets::SendReminder.new(Ticket.first).call
  end

end
