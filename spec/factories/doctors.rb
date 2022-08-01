# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    category { create(:category) }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/doctor.jpg'), 'image/jpeg') }
    phone { FFaker::PhoneNumberUA.mobile_phone_number }
    password { FFaker::Internet.password }
    full_name { FFaker::NameUA.name }
  end
end
