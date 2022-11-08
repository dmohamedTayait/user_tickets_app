# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # sequence(:email) { |n| "#{Faker::Lorem.word}-#{n}@radar-app.com" }
    email { Faker::Internet.email }
    name { Faker::Name.name }
    encrypted_password { Faker::Internet.password }
    send_due_date_reminder { 1 }
    due_date_reminder_interval { 1 }
    due_date_reminder_time { '09:00' }
    time_zone { 'EET' }
  end
end
