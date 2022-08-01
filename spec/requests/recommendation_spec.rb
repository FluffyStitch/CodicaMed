# frozen_string_literal: true

RSpec.describe 'Recommendation', type: :request do
  describe 'POST /create' do
    subject { response }

    let(:doctor) { create(:doctor) }
    let(:appointment) { create(:appointment, doctor: doctor) }
    let(:params) { attributes_for(:recommendation).slice(:text) }

    shared_context 'when doctor creates recommendation' do
      before do
        sign_in doctor
        post doctors_appointment_recommendations_path(appointment), params: { recommendation: params }
      end
    end

    context 'when valid' do
      include_context 'when doctor creates recommendation'

      it { is_expected.to have_http_status(:redirect) }
      it { is_expected.to redirect_to(doctors_appointment_path(appointment)) }
    end

    context 'when invalid' do
      include_context 'when doctor creates recommendation'

      let(:params) { { text: '' } }

      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to render_template(:new) }
    end

    context 'when doctor is not authorized to left recommendation' do
      include_context 'when doctor creates recommendation'

      let(:appointment) { create(:appointment) }

      it { is_expected.to have_http_status(:redirect) }
      it { is_expected.to redirect_to(doctors_appointments_path) }
    end

    context 'when doctor is not authenticated' do
      before do
        post doctors_appointment_recommendations_path(appointment), params: { recommendation: params }
      end

      it { is_expected.to have_http_status(:redirect) }
      it { is_expected.to redirect_to(new_doctor_session_path) }
    end
  end
end
