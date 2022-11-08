# Tickets Readme

<!-- vscode-markdown-toc -->

- 1. [ Local Installation](#LocalInstallation)
- 2. [ Run the appication](#Runappication)

# Setup

## 1. <a name='LocalInstallation'></a> Local Installation

```
-- Fill the needed values at the .env.example, then run the following commands:

cp .env.example .env
bundle install
rake db:create db:migrate db:seed
```

## 2. <a name='Runappication'></a> Setup an oauth appication

```
rails s
```

and visit

```
localhost:3000/oauth/applications
```

with a user, that has the admin flag to true

Copy the application secret and uid to your client according to the documentation there

