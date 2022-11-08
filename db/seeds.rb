# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create(
  name: 'Dina Mohamed',
  email: 'dina.mohamed85@hotmail.com',
  send_due_date_reminder: 1,
  due_date_reminder_interval: 1,
  due_date_reminder_time: '09:00',
  time_zone: 'EET',
  encrypted_password: 'my_pass_123'
)

Ticket.create(
  title: Faker::Lorem.word,
  description: Faker::Lorem.sentences,
  due_date: Time.zone.today + 5.days,
  user: User.first,
  status: 1,
  progress: 0
)
