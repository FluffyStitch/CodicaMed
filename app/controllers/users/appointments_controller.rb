# frozen_string_literal: true

module Users
  class AppointmentsController < UsersController
    def index
      scope = current_user.appointments
      appointments = Appointment::ClosedFilter.new(params: index_params, scope: scope).call
                                              .includes(doctor: %i[category])
      @presenter = AppointmentsPresenter.new(appointments, index_params)
    end

    def show
      @appointment = Appointment.find_by(id: params[:id])
      @presenter = AppointmentsPresenter.new(@appointment, index_params)
      authorize! :show, @appointment
    end

    def new
      doctor = Doctor.find_by(id: params[:doctor_id])
      @appointment = AppointmentForm.new(current_user.appointments.new(doctor: doctor))
    end

    def create
      doctor = Doctor.find_by(id: params[:doctor_id])
      @appointment = AppointmentForm.new(current_user.appointments.new(doctor: doctor))
      return render(:new) unless @appointment.validate(permitted_params)

      @appointment.save
      redirect_to users_appointment_path(@appointment)
    end

    private

    def index_params
      params.permit(:closed)
    end

    def permitted_params
      params.require(:appointment).permit(:datetime)
    end
  end
end
