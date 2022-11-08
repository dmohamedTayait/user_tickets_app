# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.integer :status
      t.integer :progress
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
