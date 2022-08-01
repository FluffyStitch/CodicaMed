# frozen_string_literal: true

class AppointmentsPresenter < ApplicationPresenter
  CHOSEN_TAB = 'chosen-category'
  CLOSED_CLASS = 'bg-danger'
  OPEN_CLASS = 'bg-success'
  CLOSED = 'appointment.closed'
  OPEN = 'appointment.open'

  attr_reader :appointments

  def initialize(appointments, params)
    super()
    @appointments = appointments
    @params = params
  end

  def appointments_count(**options)
    Appointment.where(options).count
  end

  def closed_class(appointment)
    appointment.closed ? CLOSED_CLASS : OPEN_CLASS
  end

  def status(appointment)
    I18n.t(appointment.closed ? CLOSED : OPEN)
  end

  def choosen_tab_class(tab)
    CHOSEN_TAB if tab.to_s == closed
  end

  def default_choosen_tab_class
    CHOSEN_TAB if closed.nil?
  end

  def closed
    @params[:closed]
  end
end
