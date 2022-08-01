# frozen_string_literal: true

class AppointmentForm < Reform::Form
  include Reform::Form::ActiveRecord

  MAX_APPOINTMENTS = 10
  START_WORKING_HOURS = Time.zone.parse(I18n.t(:working_hours)[:start])
  END_WORKING_HOURS = Time.zone.parse(I18n.t(:working_hours)[:end])

  properties :datetime, :doctor, validates: { presence: true }

  def datetime=(string)
    super(string.presence && Time.zone.parse(string))
  end

  validate :valid_doctor
  validate :valid_datetime

  private

  def valid_doctor
    return if doctor.appointments.where(closed: false).count < MAX_APPOINTMENTS

    errors.add(:doctor, I18n.t('errors.appointment.max_count'))
  end

  def valid_datetime
    future_datetime
    weekends
    working_hours
  end

  def future_datetime
    errors.add(:datetime, I18n.t('errors.appointment.not_in_future')) if datetime <= Time.zone.now
  end

  def weekends
    errors.add(:datetime, I18n.t('errors.appointment.weekends')) if datetime.saturday? || datetime.sunday?
  end

  def working_hours
    time = Time.zone.parse(datetime.strftime(I18n.t(:datetime)[:hours_format]))
    return if time.between?(START_WORKING_HOURS, END_WORKING_HOURS)

    errors.add(:datetime, I18n.t('errors.appointment.not_working_hours'))
  end
end
