# frozen_string_literal: true

class AppointmentsPage < SitePrism::Page
  set_url '/doctors/appointments'

  sections :appointments, AppointmentSection, 'tbody tr[class="text-center"]'
end
