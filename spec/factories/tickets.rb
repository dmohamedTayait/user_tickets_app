# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    sequence(:title) { |i| "#{Faker::Lorem.word}#{i}" }
    description { Faker::Lorem.sentences }
    due_date { Time.now + 10.days}
    status { 1 }
    progress { 1 }
    user
  end
end
