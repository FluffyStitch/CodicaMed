# frozen_string_literal: true

class EditProfilePage < SitePrism::Page
  set_url '/doctors/edit'

  section :menu, '.w-8vh' do
    element :appointments, '.fa-receipt'
  end
end
