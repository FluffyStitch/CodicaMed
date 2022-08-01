# frozen_string_literal: true

class DoctorsController < ApplicationController
  include Devisable

  before_action :authenticate_doctor!

  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def resource = current_doctor

  def access_denied
    flash.alert = I18n.t('errors.access_denied')
    redirect_to doctors_appointments_path
  end
end
