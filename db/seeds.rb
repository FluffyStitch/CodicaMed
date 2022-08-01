require 'ffaker'

AdminUser.create!(phone: '1231231212', password: 'password', password_confirmation: 'password')
doctor = Doctor.create!(phone: '1231231234', password: 'pass1234', password_confirmation: 'pass1234',
                        full_name: FFaker::NameUA.name, category: FactoryBot.create(:category))
user = User.create!(phone: '1234561234', password: '123456', password_confirmation: '123456',
                    full_name: FFaker::NameUA.name)
appointments = FactoryBot.create_list(:appointment, 2, doctor: doctor, user: user)
FactoryBot.create(:recommendation, appointment: appointments.sample)
