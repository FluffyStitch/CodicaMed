# frozen_string_literal: true

module Doctors
  class AppointmentsController < DoctorsController
    def index
      scope = current_doctor.appointments
      appointments = Appointment::ClosedFilter.new(params: permitted_params, scope: scope).call
                                              .includes(:user, :recommendation)
      @presenter = AppointmentsPresenter.new(appointments, permitted_params)
    end

    def show
      @appointment = Appointment.find_by(id: params[:id])
      @presenter = AppointmentsPresenter.new(@appointment, permitted_params)
      authorize! :show, @appointment
    end

    private

    def permitted_params
      params.permit(:closed)
    end
  end
end
