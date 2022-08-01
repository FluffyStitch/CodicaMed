# frozen_string_literal: true

module Doctors
  class RecommendationsController < DoctorsController
    def new
      appointment = Appointment.find_by(id: params[:appointment_id])
      @recommendation = appointment.build_recommendation
      authorize! :new, @recommendation
    end

    def create
      appointment = Appointment.find_by(id: params[:appointment_id])
      @recommendation = appointment.build_recommendation
      authorize! :create, @recommendation
      return render(:new) unless @recommendation.update(permitted_params)

      appointment.update(closed: true)
      redirect_to doctors_appointment_path(appointment)
    end

    private

    def permitted_params
      params.require(:recommendation).permit(:text)
    end
  end
end
