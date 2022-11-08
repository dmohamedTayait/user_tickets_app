# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tickets, dependent: :nullify
end
