# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    closed { false }
    doctor { create(:doctor) }
    user { create(:user) }
    datetime { Time.zone.tomorrow }
  end
end
