# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.boolean :send_due_date_reminder
      t.integer :due_date_reminder_interval, limit: 3
      t.time :due_date_reminder_time
      t.string :time_zone
      t.string :encrypted_password, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
