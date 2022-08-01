# frozen_string_literal: true

FactoryBot.define do
  factory :recommendation do
    text { FFaker::Lorem.paragraph }
    appointment { create(:appointment) }

    after(:create) do |recommendation|
      recommendation.appointment.update(closed: true)
    end
  end
end
