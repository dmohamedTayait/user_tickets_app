# Tickets Readme

<!-- vscode-markdown-toc -->

- 1. [ Local Installation](#LocalInstallation)
- 2. [ Run the appication](#Runappication)

# Setup

## 1. <a name='LocalInstallation'></a> Local Installation

```
-- Fill copy .env.example and name it .env ... fille the keys with the needed values.

cp .env.example .env
bundle install
rake db:create db:migrate db:seed
```

## 2. <a name='Runappication'></a> To Run the application

-- Just Open the rails console

```
rails console

```
-- then run the following query:

```
Ticket.create(
  title: Faker::Lorem.word,
  description: Faker::Lorem.sentences,
  due_date: Time.zone.today + 5.days,
  user: User.first,
  status: 1,
  progress: 0
)
```

-- You will find in the console 
1- New Ticket is created
2- Notification job runs to setup the email at the requested time.
