# frozen_string_literal: true

RSpec.describe 'Recommendation > Create', type: :feature, js: true do
  let(:current_page) { HomePage.new }
  let(:appointment) { create(:appointment) }

  before do
    current_page.load
    current_page.doctor_icon.click
    current_page = SignInPage.new
    current_page.form.phone.fill_in(with: appointment.doctor.phone)
    current_page.form.password.fill_in(with: appointment.doctor.password)
    current_page.form.sign_in.click
    current_page = EditProfilePage.new
    current_page.menu.appointments.click
    current_page = AppointmentsPage.new
    current_page.appointments.first.write_button.click
    current_page = NewRecommendationPage.new
    current_page.form.text.fill_in(with: text)
    current_page.form.write.click
  end

  describe 'success' do
    let(:text) { attributes_for(:recommendation)[:text] }

    it { expect(AppointmentPage.new).to be_displayed }
    it { expect(current_page.text).to have_text text }
  end

  describe 'failed' do
    let(:text) { '' }

    it { expect(current_page).to have_content I18n.t('errors.messages.blank') }
  end
end
