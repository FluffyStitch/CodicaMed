# frozen_string_literal: true

class AppointmentPage < SitePrism::Page
  set_url '/doctors/appointments/{id}'

  element :text, '#recommendation_text'
end
