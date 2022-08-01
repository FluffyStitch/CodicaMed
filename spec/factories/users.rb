# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    phone { FFaker::PhoneNumberUA.mobile_phone_number }
    password { FFaker::Internet.password }
    full_name { FFaker::NameUA.name }
  end
end
