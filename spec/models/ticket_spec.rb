# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject(:record) { create :ticket }

  describe 'columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:due_date).of_type(:date) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:progress).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
  end
end
