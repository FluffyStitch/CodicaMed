# frozen_string_literal: true

class SignInPage < SitePrism::Page
  set_url '/doctors/sign_in'

  section :form, '#new_doctor' do
    element :phone, '#doctor_phone'
    element :password, '#doctor_password'

    element :sign_in, '[type="submit"]'
  end
end
