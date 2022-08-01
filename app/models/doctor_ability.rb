# frozen_string_literal: true

class DoctorAbility
  include CanCan::Ability

  def initialize(doctor)
    return if doctor.blank?

    can :show, Appointment, doctor: doctor
    can :create, Recommendation, appointment: { doctor: doctor }
  end
end
