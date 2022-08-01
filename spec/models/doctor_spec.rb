# frozen_string_literal: true

RSpec.describe Doctor, type: :model do
  describe 'phone validation' do
    subject { build(:doctor) }

    context 'when valid' do
      let(:phone_number) { FFaker::PhoneNumberUA.mobile_phone_number }

      it { is_expected.to have_db_column(:phone) }
      it { is_expected.to have_db_index(:phone).unique }
      it { is_expected.to validate_presence_of(:phone) }
      it { is_expected.to validate_uniqueness_of(:phone).case_insensitive }
      it { is_expected.to allow_value(phone_number).for(:phone) }
    end

    context 'when invalid' do
      let(:phone_number) { FFaker::PhoneNumberTW.mobile_phone_number }

      it { is_expected.not_to allow_value(phone_number).for(:phone) }
    end
  end
end
