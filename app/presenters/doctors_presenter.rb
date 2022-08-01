# frozen_string_literal: true

class DoctorsPresenter < ApplicationPresenter
  CHOSEN_CATEGORY = 'chosen-category'
  DISABLED = 'disabled'

  attr_reader :doctors

  def initialize(doctors, params)
    super()
    @doctors = doctors
    @params = params
  end

  def current_filter
    @params[:filter]
  end

  def choosen_category_class(category)
    CHOSEN_CATEGORY if category.id.to_s == current_filter
  end

  def default_choosen_category_class
    CHOSEN_CATEGORY if current_filter.nil?
  end

  def doctors_count(**options)
    Doctor.where(options).count
  end

  def disabled_attr(doctor)
    doctor.appointments.open.count < AppointmentForm::MAX_APPOINTMENTS ? '' : DISABLED
  end
end
