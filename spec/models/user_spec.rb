# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:record) { create :user }

  describe 'columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:send_due_date_reminder).of_type(:boolean) }
    it { is_expected.to have_db_column(:due_date_reminder_interval).of_type(:integer) }
    it { is_expected.to have_db_column(:due_date_reminder_time).of_type(:time) }
    it { is_expected.to have_db_column(:time_zone).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:tickets) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }

    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
