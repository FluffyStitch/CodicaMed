# frozen_string_literal: true

class UsersController < ApplicationController
  include Devisable

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def resource = current_user

  def access_denied
    flash.alert = I18n.t('errors.access_denied')
    redirect_to users_appointments_path
  end
end
